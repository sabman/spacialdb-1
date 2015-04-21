class FixAssociationIds < ActiveRecord::Migration
  def change
    remove_column :instances, :user_id
    remove_column :subscriptions, :instance_id

    add_column :instances, :user_id, :uuid
    add_column :subscriptions, :instance_id, :uuid
  end
end
