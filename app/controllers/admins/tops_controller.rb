class Admins::TopsController < ApplicationController
  before_action :authenticate_admin!, except: [:admins_simple_login]

  def top
  end

  def admins_simple_login
  	admin = Admin.guest
    sign_in admin
    redirect_to admins_root_path
  end
end
