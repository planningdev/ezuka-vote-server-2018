module TokenAuthorizationConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_token!
  end

  def current_vote_token
    VoteToken.find_by!(token: vote_token)
  end

  private

  def authenticate_token!
    VoteToken.find_by!(token: vote_token)
  end

  def vote_token
    request.headers['HTTP_X_VOTE_TOKEN']
  end
end