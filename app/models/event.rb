class Event < ActiveRecord::Base

  validates_presence_of :name
  belongs_to :user
  has_many :attendees, :dependent => :destroy
  has_many :event_groupships, :dependent => :destroy
  belongs_to :category
  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user
  has_many :subscriptions, :dependent => :destroy
  has_many :subscribed_users, :through => :subscriptions, :source => :user


  delegate :name, :to => :category, :prefix => true, :allow_nil => true
  # 因為舊資料沒有category的資料, 會讀取錯誤, 允許為空值
  # delegate :name, :to => :location, :prefix => true, :allow_nil => true

  has_many :groups, :through => :event_groupships
  has_one :location
  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def find_my_like(u)
    if u
      self.likes.where(:user_id => u.id).first
    else
      nil
    end
  end

  def find_my_subscription(u)
    if u
      self.subscriptions.where(:user_id => u.id).first
    else
      nil
    end
  end

end
