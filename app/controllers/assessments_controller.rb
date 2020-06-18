class AssessmentsController < ApplicationController
  def create
    test = Test.find(params[:test_id])
    #レビューを一時的に保存。
    params[assessment] = {test_id: params[:test_id]}
  	assessment = current_user.assessments.new(assessment_params)
    user_assessment = Assessment.find_by(user_id: current_user.id, test_id: test.id)
    if  user_assessment.present?
      user_assessment.update(assessment_params)
    else
      assessment.test_id = test.id
      assessment.save(assessment_params)
    end
    redirect_back test_path(test.id)
  end

  def destroy
    assessment = Assessment.find(params[:id])
    assessment.destroy
    redirect_back test_path(assessment.test.id)
  end

  private
  def assessment_params
  	params.require(:assessment).permit(:test_id, :title, :review, :rate)
  end
end
