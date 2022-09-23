class Public::UsersController < ApplicationController

  def quit
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @medium = CategoryMedium.find(@user.category_medium_id)
    @occupation = Occupation.find(@user.occupation_id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_my_page_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :icon, :address, :occupation_id, :category_medium_id, :display_status)
  end

end
