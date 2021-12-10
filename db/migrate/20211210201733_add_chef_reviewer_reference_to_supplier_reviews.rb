class AddChefReviewerReferenceToSupplierReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :supplier_reviews, :business_accounts, column: :reviewer
    add_index :supplier_reviews, :reviewer
    change_column_null :supplier_reviews, :reviewer, false
  end
end
