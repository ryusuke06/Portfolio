class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :inquiries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :assessments, dependent: :destroy
  has_many :favorite_tests, through: :favorites, source: :test

  attachment :profile_image

  enum account:{enable: true, disable: false}

  validates :name, presence: true

  def self.guest
    find_or_create_by!(email: "test@test.com", name: "ゲストユーザー") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def exist_review?(test_id)
    assessments.find_by_test(test_id)
  end
end
