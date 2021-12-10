class AddSupplierReferenceToSupplierReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :supplier_reviews, :ingredient_suppliers,
                    column: :supplier_id
    add_index :supplier_reviews, :supplier_id
    change_column_null :supplier_reviews, :supplier_id, false
  end
end
