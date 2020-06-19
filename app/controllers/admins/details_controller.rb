class Admins::DetailsController < ApplicationController

  def show
=begin
内容はユーザー側のtests/showとやってることは一緒
sessionで一時保存と確認してから保存とかも考えたけどプレビューの途中で更新したらsession=nilで消してしまうのでボツ。
またプレビューをuser側のtests/detailで安全ではないと考えてボツ。

もしも階層構造で診断を作成できるGUIが導入できるようなら検討
=end
    @test = Test.find(params[:test_id])
    details = Detail.where(test_id: @test.id)
    results = Result.where(test_id: @test.id)
    session[:quiz] = nil

    if params[:quiz].present?

      if result.pattern.grep(params[:quiz]).present?
        result = Result.find_by(test_id: @test.id, pattern: params[:quiz])
        @question = "result"
        session[:quiz] = {"result": result}

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

  def create
  end

  def update
  end

  def destroy
  end
end
