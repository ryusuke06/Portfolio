class Admins::UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name ,:profile_image ,:account ,:email)
  end
end
