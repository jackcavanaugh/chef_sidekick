class AddIngredientSupplierJoinCountToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :ingredient_supplier_joins_count, :integer
  end
end
