class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.float :value
      t.integer :subscription_id
      t.timestamps
    end
  end
end
