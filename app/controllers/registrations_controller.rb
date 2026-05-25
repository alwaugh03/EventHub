class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end

  def show
    @registration = Registration.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @registration = @event.registrations.new
  end

  def create
    @event = Event.find(params[:event_id])
    email = params[:registration][:email]
    user = User.find_by(email: email)
    @registration = @event.registrations.new(user: user, status: :confirmed)
   
    if @registration.save
        redirect_to @event
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    if @registration.update(registration_params)
        redirect_to @registration
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @registration= Registration.find(params[:id])
    event = @registration.event 
    @registration.destroy
    redirect_to event_path(event)
  end 

  private

  def registration_params
    params.require(:registration).permit(:email)
  end

end