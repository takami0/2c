class Admin::OccupationsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @new_occupation = Occupation.new
    @occupations = Occupation.all
  end

  def create
    @new_occupation = Occupation.new(occupation_params)
    if @new_occupation.save!
      redirect_to admin_occupations_path
    else
      @occupations = Occupation.all
      render :index
    end
  end

  def edit
    @occupation = Occupation.find(params[:id])
  end

  def update
    @occupation = Occupation.find(params[:id])
    if @occupation.update(occupation_params)
      redirect_to admin_occupations_path
    else
      render :edit
    end
  end

  private
  def occupation_params
    params.require(:occupation).permit(:name)
  end

  # def ensure_occupation
  #   @occupation = Occupation.find(params[:id])
  # end
end
