class EventsController < ApplicationController
def index
  if params[:category]
    @events = Event.where(category: params[:category])
  else
    @events = Event.all
  end
end
  def show
    @event = Event.find(params[:id])
  end
end