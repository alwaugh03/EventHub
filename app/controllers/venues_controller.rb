class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  def show
  end

  def new
    before_action :authenticate_user!
    @venue = Venue.new
  end

  def create
    before_action :authenticate_user!
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to @venue, notice: "Venue created successfully."
    else
      flash.now[:alert] = @venue.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    before_action :authenticate_user!
    if @venue.update(venue_params)
      redirect_to @venue, notice: "Venue updated successfully."
    else
      flash.now[:alert] = @venue.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    before_action :authenticate_user!
    if @venue.destroy
      redirect_to venues_path, notice: "Venue deleted successfully."
    else
      redirect_to venues_path, alert: @venue.errors.full_messages.to_sentence 
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :capacity)
  end
end