class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :critique, index: true, foreign_key: true, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
