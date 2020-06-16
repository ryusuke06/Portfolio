class Test < ApplicationRecord
  belongs_to :category

  has_many :assessments
  has_many :favorites
  has_many :details
  has_many :results
  has_many :users, through: :favorites

  accepts_nested_attributes_for :details, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :results, reject_if: :all_blank, allow_destroy: true

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end
end