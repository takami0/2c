class Admin::OccupationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_occupation, only: [:edit, :update, :destroy]

  def index
    @new_occupation = Occupation.new
    @occupations = Occupation.page(params[:page]).per(5)
  end

  def create
    @new_occupation = Occupation.new(occupation_params)
    if @new_occupation.save
      redirect_to admin_occupations_path
    else
      @occupations = Occupation.all
      render :index
    end
  end

  def edit
  end

  def update
    if @occupation.update(occupation_params)
      redirect_to admin_occupations_path
    else
      render :edit
    end
  end

  def destroy
    if @occupation.destroy!
      redirect_to admin_occupations_path
    end
  end

  private
  def occupation_params
    params.require(:occupation).permit(:name)
  end

  def find_occupation
    @occupation = Occupation.find(params[:id])
  end

end
