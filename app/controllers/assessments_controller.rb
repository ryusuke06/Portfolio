class AssessmentsController < ApplicationController
  def create
    test = Test.find(params[:test_id])
  	assessment = current_user.assessments.new(assessment_params)
    user_assessment = Assessment.find_by(user_id: current_user.id, test_id: test.id)
    if  user_assessment.present?
      user_assessment.update(title: assessment.title, review: assessment.review, rate: assessment.rate)
    else
      assessment.test_id = test.id
      assessment.save(assessment_params)
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    assessment = Assessment.find(params[:id])
    assessment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def assessment_params
  	params.require(:assessment).permit(:title, :review, :rate)
  end
end
