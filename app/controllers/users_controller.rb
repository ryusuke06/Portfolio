class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
	@favorite_tests = @user.favorites
	@reccomend_tests = Test.create_reccomend

    #閲覧ジャンル傾向を表示する。
    categories = Category.all
    gon.category_name = []
    gon.tendencies = []

    categories.each do |category|
      gon.category_name.push(category.name)

      #numはジャンルごとに毎回リセット + int型が入る宣言
      num = 0
      Test.where(category_id: category.id).each do |test|

      	#ipアドレスでフィルターをかけていると0か1がint型で返ってくる。
      	#１ジャンル全ての診断のimpressionist_count（ipフィルター）を足し合わせる = このジャンルの診断をどれだけ見ているか数字が出る。（フィルターがあるので同じ診断はカウントされない）
   	    num += test.impressionist_count(:filter=>:ip_address)
   	  end

   	  gon.tendencies.push(num)
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      if @user.account == "enable" then
		    redirect_to user_path
	    elsif @user.account == "disable"
	      reset_session
	      # userを強制的にログアウトする
  	    redirect_to root_path
	    end
	  else
	    render "edit"
	  end
  end

  private
    def user_params
	  params.require(:user).permit(:name, :email, :account)
    end
end
