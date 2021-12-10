class AddIngredientReviewersReferenceToIngredientReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ingredient_reviews, :business_accounts,
                    column: :ingredient_reviewer
    add_index :ingredient_reviews, :ingredient_reviewer
    change_column_null :ingredient_reviews, :ingredient_reviewer, false
  end
end
