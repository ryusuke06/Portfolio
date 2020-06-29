module ResultPatternsCalculatable
  extend ActiveSupport::Concern

  def result_patterns(test_id, calculated_patterns)
    if calculated_patterns.present?
      return calculated_patterns
    else
      results = Result.where(test_id: test_id)
      results.pluck(:patterns).flatten!
    end
  end
end