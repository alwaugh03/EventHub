class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update]
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @review = @event.reviews.new
  end

  def create
    @event = Event.find(params[:event_id])
    @review = @event.reviews.new(review_params)
    @review.user = User.first
    if @review.save
        flash[:notice] = "The review has been created correctrly"
        redirect_to @event
    else
        flash[:alert] = "The review has not created correctrly"
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if @review.update(review_params)
        flash[:notice] = "The review has been updated correctrly"
        redirect_to @review
    else
        flash[:alert] = "The review could not updated"
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    event = @review.event 
    if @review.destroy
       flash[:notice] = "The review has been destroyed correctrly"
      redirect_to event_path(event)
    else 
      flash[:alert] = "The review could not be destroyed"
      redirect_to event_path(event)
  end

 private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end