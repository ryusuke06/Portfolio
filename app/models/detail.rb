class Detail < ApplicationRecord
  belongs_to :test

  validates :question, presence: true
  validates :first_answer, presence: true
  validates :second_answer, presence: true
end
