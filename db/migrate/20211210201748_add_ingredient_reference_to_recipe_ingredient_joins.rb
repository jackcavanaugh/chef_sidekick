class AddIngredientReferenceToRecipeIngredientJoins < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_ingredient_joins, :ingredients
    add_index :recipe_ingredient_joins, :ingredient_id
    change_column_null :recipe_ingredient_joins, :ingredient_id, false
  end
end
