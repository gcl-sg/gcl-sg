class CategoriesController < ApplicationController

  before_action :set_category

  def show

  end

  private
  def set_category
    @category = Category.visible.find(params[:id])
  end

end
