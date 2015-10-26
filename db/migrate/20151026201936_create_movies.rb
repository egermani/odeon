class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :synopsis, null: false
      t.date :release_date, null: false
      t.string :director, null: false
      t.string :still_path

      t.timestamps null: false
    end
  end
end
