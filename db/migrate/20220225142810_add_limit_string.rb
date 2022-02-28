class AddLimitString < ActiveRecord::Migration
  def change
    change_column :users, :gender, :string, limit: 5
  end
end
