class Event < ActiveRecord::Base
  validates_presence_of :name
  has_many :attendees
  has_many :event_groupships
  belongs_to :category
  delegate :name, :to => :category, :prefix => true, :allow_nil => true
  # 因為舊資料沒有category的資料, 會讀取錯誤, 允許為空值
  has_many :groups, :through => :event_groupships

end
