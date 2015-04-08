class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string  :slug,              null: false
      t.string  :name,              null: false
      t.boolean   :available
    end
  end
end
