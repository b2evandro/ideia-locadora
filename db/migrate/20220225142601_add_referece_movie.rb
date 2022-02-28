class AddRefereceMovie < ActiveRecord::Migration
  def change
    add_reference :favorites, :movie, index: true
    add_foreign_key :favorites, :movies
  end
end
