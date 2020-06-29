module UserWithdrawable
  extend ActiveSupport::Concern

  def user_withdrew?
  	if user_signed_in?
      if current_user.account == "disable"
        reset_session
      end
    else
      reset_session
    end
  end
end