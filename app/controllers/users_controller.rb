class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:show]

  def show
    @user = User.find(params[:id])
    @events = @user.events.page(params[:page]).per(5)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
  end

end
