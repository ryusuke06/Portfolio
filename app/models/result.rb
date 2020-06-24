class Result < ApplicationRecord
  belongs_to :test

  #苦肉の策：配列を保存できるようにシリアライズする
  serialize :patterns, Array

  validates :title, presence: true
  validates :caption, presence: true
  validates :youtube_url, presence: true
end
