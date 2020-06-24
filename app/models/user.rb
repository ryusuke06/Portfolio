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
end
