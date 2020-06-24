class Category < ApplicationRecord
  has_many :tests

  validates :name, presence: true, uniqueness: true
end
