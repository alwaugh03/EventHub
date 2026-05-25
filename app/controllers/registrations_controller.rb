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
        notice: "Registration created successfully."
        redirect_to @event
    else
        alert: @registration.errors.full_messages.to_sentence
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    if @registration.update(registration_params)
        notice: "Registration updated successfully."
        redirect_to @registration
    else
        alert: @registration.errors.full_messages.to_sentence
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @registration= Registration.find(params[:id])
    event = @registration.event 
    if @registration.destroy
      redirect_to event_path(event),
       notice: "Registration deleted successfully."
    else
      redirect_to event_path(event),
      alert: @registration.errors.full_messages.to_sentence
    end 
  end 

  private

  def registration_params
    params.require(:registration).permit(:email)
  end

end