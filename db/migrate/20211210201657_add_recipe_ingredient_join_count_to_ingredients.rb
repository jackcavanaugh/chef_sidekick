class AddRecipeIngredientJoinCountToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :recipe_ingredient_joins_count, :integer
  end
end
