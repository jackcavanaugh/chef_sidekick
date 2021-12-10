class AddRecipeReferenceToRecipeMenuJoins < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_menu_joins, :recipes
    add_index :recipe_menu_joins, :recipe_id
    change_column_null :recipe_menu_joins, :recipe_id, false
  end
end
