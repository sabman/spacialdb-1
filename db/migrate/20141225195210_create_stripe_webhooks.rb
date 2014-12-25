class CreateStripeWebhooks < ActiveRecord::Migration
  def change
    create_table :stripe_webhooks do |t|
      t.string :stripe_id

      t.timestamps
    end

    add_index :stripe_webhooks, :stripe_id
  end
end
