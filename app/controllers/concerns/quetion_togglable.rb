module QuetionTogglable
  extend ActiveSupport::Concern

  def what_question?(test_id, pattern)
    if Result.exist_result_patterns?(test_id, pattern)
      "result"
    else
      case pattern.to_i
      when 0
        "first"
      when 1, 2
        "second"
      when 11, 12, 21, 22
        "third"
      end
    end
  end
end
