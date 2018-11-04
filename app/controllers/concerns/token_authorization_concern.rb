module TokenAuthorizationConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_token!
  end

  private

  def authenticate_token!
    vote_token = request.headers['HTTP_X_VOTE_TOKEN']
    VoteToken.find_by!(token: vote_token)
  end
end