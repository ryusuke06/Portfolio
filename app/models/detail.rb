class Detail < ApplicationRecord
  belongs_to :test

  validates :question, presence: true
  validates :first_answer, presence: true
  validates :second_answer, presence: true

  scope :search_by_quiz_pattern, -> (test_id, pattern) {
  	details = where(test_id: test_id)
  	case pattern.to_i
  	when 0
  	  details[0]
    when 1
      details[1]
    when 2
      details[2]
    when 11
      details[3]
    when 12
      details[4]
    when 21
      details[5]
    when 22
      details[6]
  	end
  }

  scope :calculate_result_patterns, -> (test_id) {
    details = where(test_id: test_id)
    case details.count
    when 1
      ["1", "2"]
    when 2
      ["11", "12", "2"]
    when 3
      ["11", "12", "21", "22"]
    when 4
      ["111","112", "12", "21", "22"]
    when 5
      ["111","112", "121", "122", "21", "22"]
    when 6
      ["111","112", "121", "122", "211", "212", "22"]
    when 7
      ["111","112", "121", "122", "211", "212", "221", "222"]
    end
  }

  def self.first_question_exists?(first_question_id)
    first_question_id.present?
  end
end
