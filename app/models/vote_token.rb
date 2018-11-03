class VoteToken < ApplicationRecord
  validates :token, presence: true, uniqueness: true
end
