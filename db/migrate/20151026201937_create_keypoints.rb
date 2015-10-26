class CreateKeypoints < ActiveRecord::Migration
  def change
    create_table :keypoints do |t|
      t.string :image_path, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
