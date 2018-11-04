class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :type
      t.string :title, null: false
      t.string :team_name, null: false
      t.string :description, limit: 1_600
      t.column :receipt_number, 'int unsigned', null: false

      t.timestamps

      t.index :receipt_number, unique: true
    end
  end
end
