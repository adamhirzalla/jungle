class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASS']

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], flash: { success: 'Category created!' }
    else
      flash.now[:danger] = @category.errors.full_messages.first
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
