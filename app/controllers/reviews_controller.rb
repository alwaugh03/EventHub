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
        redirect_to @event
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if @review.update(review_params)
        redirect_to @review
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    event = @review.event 
    @review.destroy
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