class TestsController < ApplicationController
  impressionist actions: [:show]

  def index
    @tests = Test.recent_tests(params[:page], 9)
    @categories = Category.all

    if params[:q].present?
      @search = Test.ransack(params[:q])
      @tests = @search.result(distinct: true).where(disclose: true).page(params[:page]).per(9)
    else
    # 検索フォーム以外からアクセスした時の処理
      params[:q] = { sorts: 'id desc' }
      @search = Test.ransack(params[:q])
    end
  end

  def show
  	@test = Test.find(params[:id])
    @assessments = Assessment.recent_assessments(@test.id, params[:page], 10)

    if user_signed_in?
      @assessment = current_user.exist_review?(@test.id) || Assessment.new
    end
  end
end
