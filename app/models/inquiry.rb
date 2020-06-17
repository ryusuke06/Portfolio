class Inquiry < ApplicationRecord
  belongs_to :user

  enum read:{unread: 0 ,read: 1}
  enum demand:{improvement: 0, addition: 1}
end
