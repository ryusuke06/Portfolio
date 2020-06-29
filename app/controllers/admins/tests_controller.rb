class Admins::TestsController < ApplicationController
  before_action :authenticate_admin!
  include ResultPatternsCalculatable

  def index
    @tests = Test.recent_tests(params[:page], 10)
  end

  def show
    @test = Test.find(params[:id])
    @assessments = Assessment.recent_assessments(@test.id, params[:page], 10)
  end

  def new
    @test = Test.new
    @details = @test.details.build
    @results = @test.results.build
    @patterns = []
    @categories = Category.all
  end

  def edit
    @test = Test.find(params[:id])
    @details = @test.details
    @results = @test.results
    @categories = Category.all
    @patterns = result_patterns(@test.id, params[:patterns])
  end

  def create
    if Detail.first_question_exists?(params[:test][:details_attributes]["0"][:id])
      @test = Test.find(Detail.find(params[:test][:details_attributes]["0"][:id]).test_id)
      @test.update!(tests_params)

    else
      @test = Test.new(tests_params)
      @test.save!
    end

    patterns = Detail.calculate_result_patterns(@test.id)
    redirect_to edit_admins_test_path(id: @test.id, patterns: patterns)
  end

  def update
    @test = Test.find(params[:id])
    @test.update!(tests_params)
    redirect_to admins_test_details_path(@test)
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to admins_tests_path(@test)
  end

  private

  #ストロングパラメータで配列を扱うときには必ず最後に記述するルールがある
  def tests_params
    params.require(:test).permit(:title, :caption, :image, :category_id, :disclose,
      details_attributes:[:id, :question, :first_answer, :second_answer, :_destroy],
      results_attributes:[:id, :title, :caption, :youtube_url, :_destroy, patterns:[]]
    )
  end
end
