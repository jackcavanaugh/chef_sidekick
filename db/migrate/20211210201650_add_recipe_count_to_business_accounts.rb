class AddRecipeCountToBusinessAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :business_accounts, :recipes_count, :integer
  end
end
