class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :plan
      t.belongs_to :user
      t.integer :user_id

      t.string :stripe_subscription_id

      t.timestamps null: false
    end
  end
end
