class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
	  @category = Category.new
	  @categories = Category.all
  end

  def create
	  @category = Category.new(category_params)
	  @category.save!(category_params)
    @categories = Category.all
    redirect_back(fallback_location: root_path)
  end

  def update
    @category = Category.find(params[:id])
    @category.update!(name: params[:name])
    @categories = Category.all
    redirect_back(fallback_location: root_path)
  end

  private
	def category_params
		params.require(:category).permit(:name)
	end
end
