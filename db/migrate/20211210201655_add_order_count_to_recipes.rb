class AddOrderCountToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :orders_count, :integer
  end
end
