class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @events = Event.order('created_at DESC').where(user_id: params[:id]).page(params[:page]).per(5)
  end
end
