class RemoveIndexFromVote < ActiveRecord::Migration[5.2]
  def up
    remove_index :votes, name: 'index_votes_on_voteable_type_and_vote_token_id'
  end

  def down
    add_index :votes, ["voteable_type", "vote_token_id"], name: 'index_votes_on_voteable_type_and_vote_token_id'
  end
end
