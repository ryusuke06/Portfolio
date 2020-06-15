class TestsController < ApplicationController
  def index
    @tests = Test.all.page(params[:page]).per(10)
  end

  def show
  	@test = Test.find(params[:id])
    @user = current_user
    if user_signed_in?
  	  @assessment = Assessment.find_by(user_id: current_user.id, test_id: @test.id)
    end
  end

  def destoy
  end
end
