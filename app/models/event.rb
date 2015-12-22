class Event < ActiveRecord::Base

  validates_presence_of :name

  has_many :attendees, :dependent => :destroy
  has_many :event_groupships, :dependent => :destroy
  belongs_to :category

  delegate :name, :to => :category, :prefix => true, :allow_nil => true
  # 因為舊資料沒有category的資料, 會讀取錯誤, 允許為空值
  # delegate :name, :to => :location, :prefix => true, :allow_nil => true

  has_many :groups, :through => :event_groupships
  has_one :location
  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank

end
