class EventsController < ApplicationController

  before_action :authenticate_user!

  def show
    @event = Event.includes(:user).find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(create_params)
  end
  
  def update
    event = Event.find(params[:id])
    if event.your_event?(current_user)
      event.update(update_params)
    end
    redirect_to action: :show
  end
  
  def edit
    @event = Event.includes(:user).find(params[:id])
  end
  
  def destroy
    event = Event.find(params[:id])
    if event.your_event?(current_user)
      event.destroy
    end
    redirect_to action: :show, controller: :users, id: current_user.id
  end
    
  private
  def create_params
    params.require(:event).permit(:title, :date, :text, :sub_title).merge(user_id: current_user.id, status: "計画中")
  end
  
  def update_params
    params.require(:event).permit(:title, :date, :text, :sub_title, :status)
  end
end
