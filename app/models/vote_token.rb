class VoteToken < ApplicationRecord
  has_secure_token

  has_one

  validates :token, uniqueness: true
end
