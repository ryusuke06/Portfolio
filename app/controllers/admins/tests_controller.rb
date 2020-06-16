class Admins::TestsController < ApplicationController
  def index
    @tests = Test.order(created_at: :desc).all.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @test = Test.new
    @detail = @test.details.build
    @result = @test.results.build
  end

  def edit
  end

  def create
    @test = Test.new(tests_params)
    @test.save!
    redirect_to admins_test_details_path(@test)
  end

  def update
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
