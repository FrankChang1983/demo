class Admin::EventsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"

  def index
    @events = Event.all
  end

protected

    def check_admin
      unless current_user.admin?
        raise AvtiveRecord::RecordNotFound
      end
    end


  # def authenticate
     # authenticate_or_request_with_http_basic do |user_name, password|
       # user_name == "username" && password == "password"
     # end
  # end

end
