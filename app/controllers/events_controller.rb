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
    puts "=" * 60
    puts "MÉTODO CREATE EJECUTADO"
    puts "=" * 60
    puts "Params recibidos: #{params.inspect}"
    puts "Params de event: #{params[:event].inspect}"
    puts "=" * 60
    
    @event = Event.new(event_params)
    
    if @event.save
      puts "✅ EVENTO GUARDADO EXITOSAMENTE"
      redirect_to @event, notice: 'Evento creado exitosamente.'
    else
      puts "❌ ERRORES DE VALIDACIÓN:"
      puts @event.errors.full_messages
      puts "=" * 60
      render :new, status: :unprocessable_entity
    end
    #@event = Event.new(event_params)
    #if @event.save
    #    redirect_to @event
    #else
    #    render :new, status: :unprocessable_entity
    #end
  end

  def edit
  end

  def update
    if @event.update(event_params)
        redirect_to @event
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :category, :venue, :start_date, :end_date, :maximum_capacity, :description)
  end
end