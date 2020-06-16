class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  #デバイス機能実行前にconfigure_permitted_parametersの実行をする。

  protected
  def after_sign_in_path_for(resource)
    # ログイン後の変遷画面
    if resource == current_user
      if current_user.account == false
          reset_session
      elsif current_user.account == true
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