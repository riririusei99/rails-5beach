class EventsController < ApplicationController

  before_action :authenticate_user!

  def new
    @event = Event.new
  end

  def create
  end
end
