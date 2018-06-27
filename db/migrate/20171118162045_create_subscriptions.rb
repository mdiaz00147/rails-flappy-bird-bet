class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :plan_id
      t.datetime	:expiration
      t.integer :status
      t.timestamps
    end
  end
end
