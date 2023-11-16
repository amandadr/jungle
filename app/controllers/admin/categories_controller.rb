class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
    @product_count = Product.count where category_id: category.id
  end

  def create
    @category = Category.new(catagory_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def catagory_params
    params.require(:category).permit(
      :name
    )
  end
end
