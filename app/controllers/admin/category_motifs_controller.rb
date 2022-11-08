class Admin::CategoryMotifsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_motif, only: [:edit, :update, :destroy]

  def index
    @new_motif = CategoryMotif.new
    @motifs = CategoryMotif.page(params[:page]).per(5)
  end

  def create
    @new_motif = CategoryMotif.new(category_motif_params)
    if @new_motif.save
      redirect_to admin_category_motifs_path
    else
      @motifs = CategoryMotif.all
      render :index
    end
  end

  def edit
  end

  def update
    if @motif.update(category_motif_params)
      redirect_to admin_category_motifs_path
    else
      render :edit
    end
  end

  def destroy
    if @motif.destroy
      redirect_to admin_category_motifs_path
    end
  end

  private
  def category_motif_params
    params.require(:category_motif).permit(:name)
  end

  def set_motif
    @motif = CategoryMotif.find(params[:id])
  end

end
