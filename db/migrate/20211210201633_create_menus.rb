class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :menu_name
      t.integer :menu_creator
      t.string :menu_description

      t.timestamps
    end
  end
end
