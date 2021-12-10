class CreateSupplierReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :supplier_reviews do |t|
      t.integer :reviewer
      t.integer :supplier_id
      t.string :review_title
      t.integer :review_rating
      t.text :review_content

      t.timestamps
    end
  end
end
