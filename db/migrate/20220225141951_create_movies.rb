class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :lengt
      t.date :release_dt
      t.text :synopsis

      t.timestamps null: false
    end
  end
end
