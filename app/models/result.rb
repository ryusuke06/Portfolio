class Result < ApplicationRecord
  belongs_to :test

  serialize :patterns, Array

  validates :title, presence: true
  validates :caption, presence: true
  validates :youtube_url, presence: true



  scope :result_patterns, -> (test_id) {
  	results = where(test_id: test_id)
  	results.pluck(:id, :patterns)
  }

  def self.exist_result_patterns?(test_id, pattern)
  	result_patterns(test_id).flatten!.grep(pattern).present?
  end

#each文の場合は再度繰り返しの際に前の戻り値が消えるのでbreak ifの使えるwhile文にした。
  def self.search_by_quiz_result(test_id, pattern)
    result_id = -1
    while true do
      result_id += 1
    break if where(test_id: test_id)[result_id][:patterns].grep(pattern).present?
    end
    where(test_id: test_id)[result_id]
  end
end