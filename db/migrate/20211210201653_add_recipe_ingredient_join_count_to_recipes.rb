class AddRecipeIngredientJoinCountToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :recipe_ingredient_joins_count, :integer
  end
end
