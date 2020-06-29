class FavoritesController < ApplicationController
  before_action :authenticate_user!
  include UserWithdrawable
  before_action :user_withdrew?

  def create
	  @test = Test.find(params[:test_id])
    favorite = current_user.favorites.new(test_id: @test.id)
    favorite.save
  end

  def destroy
	  @test = Test.find(params[:test_id])
    favorite = current_user.favorites.find_by(test_id: @test.id)
    favorite.destroy
  end
end
