class Admin::AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @address_new = CategoryMedium.new
    @addresses = Address.all
  end

  def create
    if Address.new(address_params).save
      redirect_to admin_addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def edit
  end

  def update
    if @address.update!(address_params)
      redirect_to admin_addresses_path
    else
      render :edit
    end
  end

  def destroy
    if @address.destroy
      redirect_to admin_addresses_path
    end
  end

  private
  def address_params
    params.require(:address).permit(:name)
  end

  def set_address
    @address = Address.find(params[:id])
  end
  
end
