class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.text :body
      t.string :thesis
      t.string :title
      t.integer :rating

      t.timestamps null: false
    end
  end
end
