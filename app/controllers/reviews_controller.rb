class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = @event.reviews.new
    authorize! :create, @review
  end

  def create
    @review = @event.reviews.new(review_params)
    authorize! :create, @review
    @review.user = current_user
    
    if @review.save
      redirect_to @event, notice: "Review created successfully." 
    else
      flash.now[:alert] = @review.errors.full_messages.to_sentence 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize! :update, @review
  end

  def update
    authorize! :update, @review
    if @review.update(review_params)
      redirect_to @review, notice: "Review updated successfully." 
    else
      flash.now[:alert] = @review.errors.full_messages.to_sentence 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! :destroy, @review
    event = @review.event 
    
    if @review.destroy
      redirect_to event_path(event), notice: "Review deleted successfully." 
    else 
      redirect_to event_path(event), alert: @review.errors.full_messages.to_sentence  
    end 
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end