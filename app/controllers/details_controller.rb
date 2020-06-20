class DetailsController < ApplicationController
  def show
    @test = Test.find(params[:test_id])

    if Assessment.find_by(user_id: current_user.id, test_id: @test.id).nil?
      @assessment = Assessment.new
    else
      @assessment = Assessment.find_by(user_id: current_user.id, test_id: @test.id)
    end

    details = Detail.where(test_id: @test.id)
    results = Result.where(test_id: @test.id)
    session[:quiz] = nil

#「診断を開始する」から（もしくは直接）来た場合、第一問から表示するため
    if params[:quiz].present?

#この診断の結果群はチャンクが配列として入っているのでflattenで全て取り出してからgrepで完全一致検索をかけている。
      if results.pluck(:patterns).flatten!.grep(params[:quiz]).present?


=begin
result = [[:id],[:patterns]]となっている。
例）
[1,["1","2"]].flatten! = [1, "1", "2"]
[:id]は必ず先頭にある => [:id] = result[0]
"1"や"2"に対してgrep(/#{params[:quiz]}/)で検索をかければ解答順に対してのresultの[:id]がわかる（[:id]はintegerなので検索には引っかからない）
=end
        results.pluck(:id, :patterns).each do |result|
          if result.flatten!.grep(params[:quiz]).present?
            @result = Result.find_by(id: result[0])
            @question = "result"
            session[:quiz] = {"result": @result}
          end
        end

=begin
質問がいくつ増えて結果が枝分かれしても簡単に対応できる。

ロジック
viewで選択肢"1"か"2"を解答順として保存
params[:quiz][:choice]とresult.patternsの解答順を照合して回答に誘導。
なければさらにviewで前の選択肢で選んだ解答順に選択肢"1"か"2"を追加して保存
またresult.patternsと照合。この繰り返し。

resultの解答順テーブルに解答がマッチしない＝問題がまだ残っている。　※１問で終了の場合は必ずresult_pathに行くので考えなくていい
@questionはshow.js.erbで第何問か振り分けたいため。
@detailで問題の内容を変更。
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
