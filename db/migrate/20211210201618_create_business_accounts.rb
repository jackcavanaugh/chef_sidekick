class CreateBusinessAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :business_accounts do |t|
      t.string :business_name

      t.timestamps
    end
  end
end
