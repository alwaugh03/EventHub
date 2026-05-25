class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end
end

def new
    @review = Review.new
  end

  def create
    @review = Review.new(event_params)
    if @review.save
        redirect_to @review
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
        redirect_to @review
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to review_url
  end

 private

  def set_review
    @event = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :text)
  end
end