class AddIngredientSupplierJoinReferenceToIngredientReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ingredient_reviews, :ingredient_supplier_joins
    add_index :ingredient_reviews, :ingredient_supplier_join_id
    change_column_null :ingredient_reviews, :ingredient_supplier_join_id, false
  end
end
