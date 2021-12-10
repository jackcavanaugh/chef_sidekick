class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :business_id
      t.string :recipe_name
      t.text :recipe_description

      t.timestamps
    end
  end
end
