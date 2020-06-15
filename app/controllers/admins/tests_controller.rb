class Admins::TestsController < ApplicationController
  def index
    @tests = Test.all.page(params[:page]).per(10)
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
  end

  def update
  end

  def destroy
  end

  def preview
  end

  private
  def tests_params
    params.require(:test).permit(:title, :caption, :image_id, :category_id, :disclose,
      details_attributes[:id, :question, :first_answer, :second_answer, :_destroy],
      results_attributes[:id, :title, :caption, :youtube_url, :pattern, :_destroy]
    )
  end
end
