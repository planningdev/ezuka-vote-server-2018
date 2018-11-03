class VoteToken < ApplicationRecord
  has_secure_token

  validates :token, uniqueness: true
end
