class AddFeaturedToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :featured, :boolean, default: false
  end
end
