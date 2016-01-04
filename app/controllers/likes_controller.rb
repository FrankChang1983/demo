class LikesController < ApplicationController
  before_action :set_events
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    Like.create!(:event => @event, :user => current_user)
    redirect_to :back
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy
    redirect_to :back
  end
end
