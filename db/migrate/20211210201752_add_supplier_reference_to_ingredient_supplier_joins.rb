class AddSupplierReferenceToIngredientSupplierJoins < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ingredient_supplier_joins, :ingredient_suppliers, column: :supplier_id
    add_index :ingredient_supplier_joins, :supplier_id
    change_column_null :ingredient_supplier_joins, :supplier_id, false
  end
end
