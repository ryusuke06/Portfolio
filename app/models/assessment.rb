class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates :title, presence: true, length: {maximum: 30 }
  validates :review, length: {maximum: 100 }
end
