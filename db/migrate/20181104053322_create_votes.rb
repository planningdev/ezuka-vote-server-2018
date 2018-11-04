class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.string :type, null: false
      t.references :voteable, polymorphic: true, index: true
      t.references :vote_token, foreign_key: true

      t.timestamps

      t.index %i(voteable_type vote_token_id), unique: true
    end
  end
end
