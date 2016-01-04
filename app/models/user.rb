class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :events
    has_many :likes, :dependent => :destroy
    has_many :liked_events, :through =>:likes, :source => :event
    has_many :subscriptions, :dependent => :destroy
    has_many :subscribed_events, :through => :subscriptions, :source => :event

    def short_name
      self.email.split("@").first
    end

    def display_name
      first_name || last_name || short_name || email
    end

    def admin?
      self.role == "admin"
    end
end

