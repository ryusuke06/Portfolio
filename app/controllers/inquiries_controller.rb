class InquiriesController < ApplicationController
  def new
  	@inquiry = Inquiry.new
  end

  def create
    params[:inquiry] = {user_id: current_user.id, title: params[:title], content: params[:content], demand: params[:demand], read: params[:read]}
    @inquiry = Inquiry.new(inquiries_params)
    @inquiry.save
    redirect_back(fallback_location: root_path)
  end

  private
  def inquiries_params
  	params.require(:inquiry).permit(:user_id ,:title ,:content ,:demand ,:read)
  end
end
