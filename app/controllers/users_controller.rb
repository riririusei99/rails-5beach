class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @events = Event.order('created_at DESC').where(user_id: params[:id])
  end
end
