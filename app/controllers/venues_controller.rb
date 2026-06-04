class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @venues = Venue.all
  end

  def show
  end

  def new
    @venue = Venue.new
    authorize! :create, @venue
  end

  def create
    @venue = Venue.new(venue_params)
    authorize! :create, @venue

    if @venue.save
      redirect_to @venue, notice: "Venue created successfully."
    else
      flash.now[:alert] = @venue.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize! :update, @venue
  end

  def update
    authorize! :update, @venue
    if @venue.update(venue_params)
      redirect_to @venue, notice: "Venue updated successfully."
    else
      flash.now[:alert] = @venue.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! :destroy, @venue
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