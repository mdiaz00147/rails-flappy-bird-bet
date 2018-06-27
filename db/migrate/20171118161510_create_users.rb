class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :username
      t.string :email
      t.datetime :born_date
      t.integer :phone, limit: 8
      t.integer :document
      t.string :password_digest
      t.attachment :avatar 
      t.timestamps
    end
  end
end
