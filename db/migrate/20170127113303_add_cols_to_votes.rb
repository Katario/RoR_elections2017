class AddColsToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :vote_validation, :boolean
  end
end
