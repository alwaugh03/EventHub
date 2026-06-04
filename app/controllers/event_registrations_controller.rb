class EventRegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new, :create]
  before_action :authenticate_user!

  def index
    @registrations = Registration.all
  end

  def show
  end

  def new
    @registration = @event.registrations.new
    authorize! :create, @registration
  end

  def create
    authorize! :create, @registration
    email = params[:registration][:email]
    user = User.find_by(email: email)
    @registration = @event.registrations.new(user: user, status: :confirmed)
   
    if @registration.save
      redirect_to @event, notice: "Registration created successfully."  
    else
      flash.now[:alert] = @registration.errors.full_messages.to_sentence  
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize! :update, @registration
  end

  def update
    authorize! :update, @registration
    if @registration.update(registration_params)
      redirect_to @registration, notice: "Registration updated successfully." 
    else
      flash.now[:alert] = @registration.errors.full_messages.to_sentence  
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! :destroy, @registration
    event = @registration.event 
    
    if @registration.destroy
      redirect_to event_path(event), notice: "Registration deleted successfully." 
    else
      redirect_to event_path(event), alert: @registration.errors.full_messages.to_sentence 
    end
  end

  private

  def set_registration
    @registration = Registration.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def registration_params
    params.require(:registration).permit(:email)
  end
end