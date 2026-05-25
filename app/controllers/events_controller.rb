class EventsController < ApplicationController
before_action :set_event, only: [:show, :edit, :update, :destroy]

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
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = User.first
    if @event.save
        redirect_to @event
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    if @event.update(event_params)
        redirect_to @event
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :category_id, :venue_id, :start_date, :end_date, :maximum_capacity, :description)
  end
end