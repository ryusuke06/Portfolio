class TopsController < ApplicationController
  include UserWithdrawable
  before_action :user_withdrew?

  def top
  	@arrival_tests = Test.create_arrival
  end

  def user_simple_login
  	user = User.guest
    sign_in user
    redirect_to root_path
  end
end
