class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :keypoint, index: true, foreign_key: true
      t.references :review, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
