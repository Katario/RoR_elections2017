class AddColsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :forname, :string
  end
end
