class Admins::InquiriesController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@inquiries = Inquiry.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
  	@inquiry = Inquiry.find(params[:id])
  end

  def update
    params[:inquiry] = {read: params[:read]}
  	@inquiry = Inquiry.find(params[:id])
  	@inquiry.update!(inquiry_params)
    redirect_to admins_inquiries_path
  end

  def unread
  	@inquiries = Inquiry.where(read: 0).order(created_at: :desc).page(params[:page]).per(10)
  	render :index
  end

  private
  def inquiry_params
  	params.require(:inquiry).permit(:read)
  end
end
