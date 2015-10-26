class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :movie, index: true, foreign_key: true, null: false
      t.text :body, null: false
      t.string :thesis, null: false
      t.string :title, null: false
      t.integer :rating, null: false

      t.timestamps null: false
    end
  end
end
