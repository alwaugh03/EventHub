class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    before_action :authenticate_user!
    @category = Category.new
  end

def create
  before_action :authenticate_user!
  @category = Category.new(category_params)

  if @category.save
    redirect_to @category,
                notice: "Category created successfully."
  else
    flash.now[:alert] = "Please fix the errors below."

    render :new,
           status: :unprocessable_entity
  end
end

def update
  before_action :authenticate_user!
  if @category.update(category_params)
    redirect_to @category,
                notice: "Category updated successfully."
  else
    flash.now[:alert] = "Please fix the errors below."

    render :edit,
           status: :unprocessable_entity
  end
end

def destroy
  before_action :authenticate_user!
  if @category.destroy
    redirect_to categories_path,
                notice: "Category deleted successfully."
  else
    redirect_to categories_path,
                alert: @category.errors.full_messages.to_sentence
  end
end
  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(
      :name,
      :description
    )
  end
end