class VoteToken < ApplicationRecord
  has_secure_token

  has_one :idea_vote
  has_one :app_vote

  validates :token, uniqueness: true
end
