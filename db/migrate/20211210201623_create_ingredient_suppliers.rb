class CreateIngredientSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_suppliers do |t|
      t.string :supplier_name
      t.text :supplier_description
      t.string :supplier_location

      t.timestamps
    end
  end
end
