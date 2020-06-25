class Inquiry < ApplicationRecord
  belongs_to :user

  enum read:{unread: 0 ,read: 1}
  enum demand:{improvement: 0, addition: 1}

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :demand, presence: true
  validates :content, presence: true, length: { minimum: 10, maximum: 200 }
end
