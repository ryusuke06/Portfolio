class Inquiry < ApplicationRecord
  belongs_to :user

  enum read:{0: unread, 1: read}
  enum demand:{0: improvement, 1: addition}
end
