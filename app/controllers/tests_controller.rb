class TestsController < ApplicationController
  impressionist actions: [:show]

  def index
    @tests = Test.where(disclose: true).order(created_at: :desc).all.page(params[:page]).per(9)
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
    @assessments = Assessment.where(test_id: @test.id).order(created_at: :desc).page(params[:page]).per(10)

    if user_signed_in?
      @user = current_user
      if Assessment.find_by(user_id: @user.id, test_id: @test.id).present?
        @assessment = Assessment.find_by(user_id: @user.id, test_id: @test.id)
      else
        @assessment = Assessment.new
      end
    end
  end

  def destoy
  end
end
