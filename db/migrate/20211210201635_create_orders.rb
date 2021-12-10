class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :recipe_id
      t.text :customer_comments

      t.timestamps
    end
  end
end
