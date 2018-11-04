class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true
  belongs_to :vote_token
end
