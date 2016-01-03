class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :events

    def short_name
      self.email.split("@").first
    end

    def display_name
      first_name || last_name || short_name || email
    end
end

