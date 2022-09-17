class Admin::CategoryMediaController < ApplicationController
  before_action :set_medium, only: [:edit, :update, :destroy]

  def index
    @medium_new = CategoryMedium.new
    @media = CategoryMedium.all
  end

  def create
    if CategoryMedium.new(category_medium_params).save
      redirect_to admin_category_media_path
    else
      @media = CategoryMedium.all
      render :index
    end
  end

  def edit
  end

  def update
    if @medium.update!(category_medium_params)
      redirect_to admin_category_media_path
    else
      render :edit
    end
  end

  def destroy
    if @medium.destroy
      redirect_to admin_category_media_path
    end
  end

  private
  def category_medium_params
    params.require(:category_medium).permit(:name)
  end

  def set_medium
    @medium = CategoryMedium.find(params[:id])
  end

end
