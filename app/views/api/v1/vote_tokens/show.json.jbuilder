json.votable do
  json.app @vote_token.app_vote.nil?
  json.idea @vote_token.idea_vote.nil?
end