class AddRecipeReferenceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :orders, :recipes
    add_index :orders, :recipe_id
    change_column_null :orders, :recipe_id, false
  end
end
