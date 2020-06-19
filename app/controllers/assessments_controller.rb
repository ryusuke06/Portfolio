class AssessmentsController < ApplicationController
  def create
    test = Test.find(params[:test_id])
    #なぜかmodel:assessmentで送ったとしても:titleと:reviewがこない、model:[user, assessment]だとparams[:user]に入る謎
    params[:assessment] = {test_id: params[:test_id], title: params[:user][:title], review: params[:user][:review]}
    #レビューを一時的に保存。
  	assessment = current_user.assessments.new(assessment_params)
    user_assessment = Assessment.find_by(user_id: current_user.id, test_id: test.id)

    #すでに同じ診断でレビューしていた場合は上書き保存
    if  user_assessment.present?
      user_assessment.update!(assessment_params)
      redirect_back(fallback_location: root_path)

    #新規投稿
    else
      assessment.test_id = test.id
      assessment.save!(assessment_params)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    assessment = Assessment.find(params[:id])
    assessment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def assessment_params
  	params.require(:assessment).permit(:user_id, :test_id, :title, :review, :rate)
  end
end
