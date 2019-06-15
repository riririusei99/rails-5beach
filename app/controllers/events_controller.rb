class EventsController < ApplicationController

  before_action :authenticate_user!

  def show
    @event = Event.includes(:user).find(params[:id])
    binding.pry
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(create_params)
  end
  
  private
  def create_params
    params.require(:event).permit(:title, :date, :text).merge(owner_id: current_user.id)
  end
end
