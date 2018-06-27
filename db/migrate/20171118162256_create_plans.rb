class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.integer :code
      t.string :name
      t.float :price
      t.integer :tickets
      t.timestamps
    end
  end
end
