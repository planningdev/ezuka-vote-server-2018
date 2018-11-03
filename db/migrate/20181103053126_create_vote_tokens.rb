class CreateVoteTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_tokens do |t|
      t.string :token

      t.timestamps

      t.index :token, unique: true
    end
  end
end
