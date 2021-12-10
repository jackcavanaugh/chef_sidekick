class AddRecipeReferenceToRecipeIngredientJoins < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_ingredient_joins, :recipes
    add_index :recipe_ingredient_joins, :recipe_id
    change_column_null :recipe_ingredient_joins, :recipe_id, false
  end
end
