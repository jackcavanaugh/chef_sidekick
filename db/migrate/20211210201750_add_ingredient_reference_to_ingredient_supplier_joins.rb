class AddIngredientReferenceToIngredientSupplierJoins < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ingredient_supplier_joins, :ingredients
    add_index :ingredient_supplier_joins, :ingredient_id
    change_column_null :ingredient_supplier_joins, :ingredient_id, false
  end
end
