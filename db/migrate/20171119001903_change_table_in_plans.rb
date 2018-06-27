class ChangeTableInPlans < ActiveRecord::Migration[5.1]
  def change
  	remove_column :plans, :price
  	add_column :plans, :price_units, :string
  	add_column :plans, :price_cents, :string
  end
end
