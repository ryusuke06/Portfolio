class Admins::TestsController < ApplicationController
  def index
    @tests = Test.all.page(params[:page]).per(10)
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
    @details = @test.details.build
    @results = @test.results.build
    @patterns = []
    @categories = Category.all
  end

  def edit
    @test = Test.find(params[:id])
    @details = @test.details
    @results = @test.results
    if params[:patterns].present?
      @patterns = params[:patterns]

    #普通にeditから来た時とかは@patternsにresult.patternを永遠と配列を足す続ける
    else
      @patterns = []
      @results.each do |result|
        @patterns.push(result.pattern)

        #flatten!メソッドで配列中に含まれる配列からすべて要素を取り出して、親の配列の中に並べる
        @patterns.flatten!
      end
      binding.pry
    end
    @categories = Category.all
  end

  def create
    @test = Test.new(tests_params)
    @test.save!

    #診断結果の中身が存在しているか確認して、なければdetailから解答順がいくつあるか計算。　簡略化するために規則性がないか要検討
    if @test.results.blank?
      if @test.details.count == 1
        @patterns = ["1", "2"]
      elsif @test.details.count == 2
        @patterns = ["11", "12", "2"]
      elsif @test.details.count == 3
        @patterns = ["11", "12", "21", "22"]
      elsif @test.details.count == 4
        @patterns = ["111","112", "12", "21", "22"]
      elsif @test.details.count == 5
        @patterns = ["111","112", "121", "122", "21", "22"]
      elsif @test.details.count == 6
        @patterns = ["111","112", "121", "122", "211", "212", "22"]
      elsif @test.details.count == 7
        @patterns = ["111","112", "121", "122", "211", "212", "221", "222"]
      end

      #一つの診断結果を複数の解答順で使いまわせるように配列で保存したい
      #苦肉の策としてeditで続きをすることに
      redirect_to edit_admins_test_path(id: @test.id, patterns: @patterns)

    #念の為
    else
      redirect_to admins_tests_path(@test)
    end
  end

  def update
    @test = Test.find(params[:id])
    @test.update!(tests_params)
      binding.pry
    redirect_to admins_test_details_path(@test)
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to admins_tests_path(@test)
  end

  private

  #酢トロングパラメータで配列を扱うときには必ず最後に記述するルールがある
  def tests_params
    params.require(:test).permit(:title, :caption, :image, :category_id, :disclose,
      details_attributes:[:id, :question, :first_answer, :second_answer, :_destroy],
      results_attributes:[:id, :title, :caption, :youtube_url, :_destroy, pattern:[]]
    )
  end
end
