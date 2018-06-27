class CreateTurns < ActiveRecord::Migration[5.1]
  def change
    create_table :turns do |t|
      t.datetime :start
      t.datetime :end
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
