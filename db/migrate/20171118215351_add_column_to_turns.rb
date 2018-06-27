class AddColumnToTurns < ActiveRecord::Migration[5.1]
  def change
  	remove_column :turns, :user_id
    add_column :turns, :subscription_id, :integer
  end
end
