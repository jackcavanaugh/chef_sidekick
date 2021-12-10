class CreateIngredientSupplierJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_supplier_joins do |t|
      t.integer :ingredient_id
      t.integer :supplier_id
      t.boolean :preferred_supplier
      t.string :ingredient_cost
      t.integer :average_lead_time_in_days
      t.integer :ingredient_inventory

      t.timestamps
    end
  end
end
