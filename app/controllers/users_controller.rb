class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(current_user.id)
		@favorite_tests = @user.favorites
		@reccomend_tests = Test.create_reccomend
	end

	def edit
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(current_user.id)
		if @user.update(user_params)
			if @user.account == "enable" then
		  		redirect_to user_path
			elsif @user.account == "disable"
				reset_session
				# userを強制的にログアウトする
	      		redirect_to root_path
			end
		else
			render "edit"
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :account)
	end
end
