class AddMenuReferenceToRecipeMenuJoins < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_menu_joins, :menus
    add_index :recipe_menu_joins, :menu_id
    change_column_null :recipe_menu_joins, :menu_id, false
  end
end
