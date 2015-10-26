class CreateCritiques < ActiveRecord::Migration
  def change
    create_table :critiques do |t|
      t.references :user, index: true, foreign_key: true
      t.references :review, index: true, foreign_key: true
      t.references :keypoint, index: true, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
