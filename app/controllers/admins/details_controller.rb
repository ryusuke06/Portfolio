class Admins::DetailsController < ApplicationController
  before_action :authenticate_admin!
  before_action :session_clear
  include QuetionTogglable

  def show
    @test = Test.find(params[:test_id])
    @question = what_question?(@test.id, params[:quiz])
    @assessments = Assessment.recent_assessments(@test.id, params[:page], 10)

    if user_signed_in?
      @assessment = current_user.exist_review?(@test.id) || Assessment.new
    end

    if params[:quiz].present?

      if Result.exist_result_patterns?(@test.id, params[:quiz])
        @result = Result.search_by_quiz_result(@test.id, params[:quiz])

      else
        session[:quiz] = { detail: Detail.search_by_quiz_pattern(@test.id, params[:quiz].to_i), choice: params[:quiz]}
      end

    else
      session[:quiz] = { detail: Detail.search_by_quiz_pattern(@test.id, params[:quiz].to_i)}
    end
  end

  def session_clear
    session[:quiz] = nil
  end
end
