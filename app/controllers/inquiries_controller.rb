class InquiriesController < ApplicationController
  def new
  	@inquiry = Inquiry.new
  end

  private
  def inquiry_params
  	params.require(:inquiry).permit(:title ,:content ,:demand ,:read)
  end
end
