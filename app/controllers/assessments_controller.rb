class AssessmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    test = Test.find(params[:test_id])
  	assessment = current_user.assessments.new(assessment_params)
    assessment.test_id = test.id
    assessment.save!(assessment_params)
    redirect_to test_path(test)
  end

  def update
    #すでに同じ診断でレビューしていた場合は上書き保存
    test = Test.find(params[:test_id])
    assessment = Assessment.find_by(user_id: current_user.id, test_id: params[:test_id])
    assessment.update!(assessment_params)
    redirect_to test_path(test)
  end

  def destroy
    test = Test.find(params[:test_id])
    assessment = Assessment.find_by(user_id: current_user.id, test_id: params[:test_id])
    assessment.destroy
    redirect_to test_path(test)
  end

  private
  def assessment_params
  	params.require(:assessment).permit(:user_id, :test_id, :title, :review, :rate)
  end
end
