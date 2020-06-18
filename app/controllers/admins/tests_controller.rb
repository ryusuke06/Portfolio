class Admins::TestsController < ApplicationController
  def index
    @tests = Test.all.page(params[:page]).per(10)
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
    @details = @test.details.build
    @results = @test.results.build
    @categories = Category.all
  end

  def edit
    @test = Test.find(params[:id])
    @details = @test.details
    @results = @test.results
    @categories = Category.all
  end

  def create
    @test = Test.new(tests_params)
    @test.save!
    redirect_to admins_test_details_path(@test)
  end

  def update
    @test = Test.find(params[:id])
    @test.update!(tests_params)
    redirect_to admins_test_details_path(@test)
  end

  def destroy
  end

  private
  def tests_params
    params.require(:test).permit(:title, :caption, :image, :category_id, :disclose,
      details_attributes:[:id, :question, :first_answer, :second_answer, :_destroy],
      results_attributes:[:id, :title, :caption, :youtube_url, :pattern, :_destroy]
    )
  end
end
