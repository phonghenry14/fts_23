class Admin::UsersController < ApplicationController
  def index
    @search = User.search params[:q]
    @users = @search.result
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
