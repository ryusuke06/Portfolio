class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception, with: :null_session
  #adminとuserのログインによるトークンエラーを回避するため


  protected
  def after_sign_in_path_for(resource)
    # ログイン後の変遷画面
    if resource == current_user
      if current_user.account == "disable"
          reset_session
      elsif current_user.account == "enable"
        root_path
      end
    else
      admins_root_path
    end
  end

   def after_sign_out_path_for(resource)
    # ログアウト後の変遷画面
    if resource == :user
      root_path
    elsif resource == :admin
      new_admin_session_path
    end

  end
end