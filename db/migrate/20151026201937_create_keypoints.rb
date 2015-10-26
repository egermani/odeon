class CreateKeypoints < ActiveRecord::Migration
  def change
    create_table :keypoints do |t|
      t.string :image_path
      t.string :name

      t.timestamps null: false
    end
  end
end
