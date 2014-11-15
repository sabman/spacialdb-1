class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table(:subscriptions, id: :uuid) do |t|
      t.belongs_to :plan
      t.belongs_to :instance

      t.string :stripe_subscription_id

      t.timestamps null: false
    end
  end
end
