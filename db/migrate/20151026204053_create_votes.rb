class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :review, index: true, foreign_key: true, null: false
      t.integer :sentiment, null: false

      t.timestamps null: false
    end
  end
end
