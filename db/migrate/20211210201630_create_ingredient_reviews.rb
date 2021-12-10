class CreateIngredientReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_reviews do |t|
      t.integer :ingredient_reviewer
      t.integer :ingredient_supplier_join_id
      t.integer :ingredient_supplier_rating
      t.text :ingredient_supplier_review_description

      t.timestamps
    end
  end
end
