class Admin::CategoryMediaController < ApplicationController
  def index
    @medium = CategoryMedium.new
    @media = CategoryMedium.all
  end
  
  def create
    @medium = CategoryMedium.new(category_medium_params)
    if @medium.save
      redirect_to admin_category_media_path
    else
      @media = CategoryMedium.all
      render :index
    end
  end

  def edit
    # @medium = CategoryMedium.find(params[:id])
  end
  
  def update
    @medium = CategoryMedium.find(params[:id])
    if @medium.update(category_medium_params)
      redirect_to admin_category_media_path
    else
      render :edit
    end
  end
  
  private
  def category_medium_params
    params.require(:category_medium).permit(:name)
  end
  
end
