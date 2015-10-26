class CreateCritiques < ActiveRecord::Migration
  def change
    create_table :critiques do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :review, index: true, foreign_key: true, null: false
      t.references :keypoint, index: true, foreign_key: true, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
