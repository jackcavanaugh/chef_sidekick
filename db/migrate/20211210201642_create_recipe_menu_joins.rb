class CreateRecipeMenuJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_menu_joins do |t|
      t.integer :menu_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
