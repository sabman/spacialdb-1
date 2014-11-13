class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :amount,                null: false
      t.string  :currency,              null: false
      t.string  :interval,              null: false
      t.integer :interval_count,        default: 1
      t.string  :name,                  null: false
      t.integer :trial_period_days
      t.string  :statement_description, default: ""
      t.json    :metadata,              default: {}
    end
  end
end
