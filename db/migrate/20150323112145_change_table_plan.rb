class ChangeTablePlan < ActiveRecord::Migration
  def change
    rename_column :plans, :statement_description, :statement_descriptor
  end
end
