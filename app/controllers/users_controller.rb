class UsersController < ApplicationController
  before_action :authenticate_user!
  include GraphDrawable
  include UserWithdrawable
  before_action :user_withdrew?

  def show
    @user = User.find(current_user.id)
    @favorite_tests = @user.favorites
    @reccomend_tests = Test.create_reccomend

    gon.category_name = unique_access_name
    gon.tendencies = total_unique_access
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      user_withdrew?
	  else
	    render "edit"
	  end
  end

  private
    def user_params
	  params.require(:user).permit(:name, :email, :account, :profile_image)
    end
end
