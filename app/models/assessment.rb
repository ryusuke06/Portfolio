class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates :title, presence: true, length: {maximum: 30 }
  validates :review, length: {maximum: 100 }

  scope :find_by_test, -> (test_id) { find_by(test_id: test_id) }

  def self.recent_assessments(test_id, page, count)
  	assessments = where(test_id: test_id)
  	assessments.order(reated_at: :desc).page(page).per(count)
  end
end
