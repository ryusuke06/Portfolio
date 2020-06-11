class TestsController < ApplicationController
  def index
    @tests = Test.all.page(params[:page]).per(10)
  end

  def destoy
  end
end
