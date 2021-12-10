class CreateRecipeIngredientJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredient_joins do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
