module TestSortable
  extend ActiveSupport::Concern

  def sort(test_id)
    test = Test.find(test_id)
    test.update!(test_params)
    render nothing: true
    #head :ok
  end
end