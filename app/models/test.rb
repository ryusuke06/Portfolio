class Test < ApplicationRecord
  belongs_to :category

  has_many :assessments
  has_many :favorites
  has_many :details, dependent: :destroy, -> { order(position: :asc) }
  has_many :results, dependent: :destroy, -> { order(position: :asc) }
  has_many :users, through: :favorites

  accepts_nested_attributes_for :details, reject_if: :all_blank, allow_destroy: true, limit:7
  accepts_nested_attributes_for :results, reject_if: :all_blank, allow_destroy: true, limit:8

  attachment :image

  enum disclose:{disclose: true, close: false}

  validates :title, presence: true
  validates :caption, presence: true

#閲覧数チェック(gem:impressionist)
  is_impressionable :counter_cache => true

#いいねしてるかどうか
  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

#favoriteテーブルにあるtest_idの数から降順で上位３位を取ってくる。同着ならid順で。
  def self.create_reccomend
    find(Favorite.group(:test_id).order("count(test_id) desc").limit(3).pluck(:test_id))
  end

  def self.create_arrival
    all.order(created_at: :desc).limit(8)
  end

  def self.recent_tests(page, count)
    all.order(created_at: :desc).page(page).per(count)
  end
end
