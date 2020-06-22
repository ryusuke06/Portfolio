class TopsController < ApplicationController
  def top
  	@arrival_tests = Test.create_arrival
  end
end
