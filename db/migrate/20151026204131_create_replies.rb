class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user, index: true, foreign_key: true
      t.references :critique, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
