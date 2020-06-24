class TestsController < ApplicationController
  impressionist actions: [:show]

  def index
    @tests = Test.where(disclose: true).order(created_at: :desc).all.page(params[:page]).per(9)
  end

  def show
  	@test = Test.find(params[:id])
    @user = current_user
    @assessments = Assessment.where(test_id: @test.id).order(created_at: :desc).page(params[:page]).per(10)
    if Assessment.find_by(user_id: current_user.id, test_id: @test.id).nil?
      @assessment = Assessment.new
    else
      @assessment = Assessment.find_by(user_id: current_user.id, test_id: @test.id)
    end
  end

  def destoy
  end
end
