class AddMenuCreatorsReferenceToMenus < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :menus, :business_accounts, column: :menu_creator
    add_index :menus, :menu_creator
    change_column_null :menus, :menu_creator, false
  end
end
