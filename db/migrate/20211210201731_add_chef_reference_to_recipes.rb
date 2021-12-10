class AddChefReferenceToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipes, :business_accounts, column: :business_id
    add_index :recipes, :business_id
    change_column_null :recipes, :business_id, false
  end
end
