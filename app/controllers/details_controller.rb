class DetailsController < ApplicationController
  def show
  	@test = Test.find(params[:test_id])
	  details = Detail.where(test_id: @test.id)
    session[:quiz] = nil

#「診断を開始する」から（もしくは直接）来た場合、第一問から表示するため
  	if params[:quiz].present?

  	  if Result.find_by(test_id: @test.id, pattern: params[:quiz]).present?
        result = Result.find_by(test_id: @test.id, pattern: params[:quiz])
        @question = "result"
        session[:quiz] = {"result": result}
        if user_signed_in?
          @user = User.find(current_user.id)
        end

=begin
質問がいくつ増えて結果が枝分かれしても簡単に対応できる。

resultの解答順テーブルに解答がマッチしない＝問題がまだ残っている。　※１問で終了の場合は必ずresult_pathに行くので考えなくていい
@questionはshow.js.erbで第何問か振り分けたいため。
@detailで問題の内容を変更変える。
=end

  	  elsif params[:quiz].to_i < 2
  	  	@question = "second"
        session[:quiz] = {"detail": details[1],"choice": params[:quiz]}

  	  elsif params[:quiz].to_i < 11
  	  	@question = "second"
        session[:quiz] = {"detail": details[2],"choice": params[:quiz]}

  	  elsif params[:quiz].to_i < 12
  	  	@question = "third"
        session[:quiz] = {"detail": details[3],"choice": params[:quiz]}

  	  elsif params[:quiz].to_i < 21
  	    @question = "third"
  	    session[:quiz] = {"detail": details[4],"choice": params[:quiz]}

  	  elsif params[:quiz].to_i < 22
  	    @question = "third"
  	    session[:quiz] = {"detail": details[5],"choice": params[:quiz]}

  	  elsif params[:quiz].to_i < 23
  	    @question = "third"
  	    session[:quiz] = {"detail": details[6],"choice": params[:quiz]}
  	  end

  	else
  	    @question = "first"
        session[:quiz] = {"detail": details[0]}
  	end
  end
end
