class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :keypoint, index: true, foreign_key: true, null: false
      t.references :review, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
