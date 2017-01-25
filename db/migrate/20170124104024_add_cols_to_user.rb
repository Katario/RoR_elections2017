class AddColsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :forname, :string
    add_column :users, :postal, :string
    add_column :users, :bureau, :integer
    add_column :users, :active, :boolean
    add_column :users, :tour1, :boolean
    add_column :users, :tour2, :boolean
  end
end
