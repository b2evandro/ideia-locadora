class NotNullKey < ActiveRecord::Migration
  def change
    change_column_null :favorites, :user_id, false
    change_column_null :favorites, :movie_id, false
  end
end
