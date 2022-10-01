class Admin::CategoryStylesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_style, only: [:edit, :update, :destroy]

  def index
    @style_new = CategoryStyle.new
    @styles = CategoryStyle.all
  end

  def create
    if CategoryStyle.new(category_style_params).save
      redirect_to admin_category_styles_path
    else
      @styles = CategoryStyle.all
      render :index
    end
  end

  def edit
  end

  def update
    if @style.update!(category_style_params)
      redirect_to admin_category_styles_path
    else
      render :edit
    end
  end

  def destroy
    if @style.destroy
      redirect_to admin_category_styles_path
    end
  end

  private
  def category_style_params
    params.require(:category_style).permit(:name)
  end

  def set_style
    @style = CategoryStyle.find(params[:id])
  end

end
