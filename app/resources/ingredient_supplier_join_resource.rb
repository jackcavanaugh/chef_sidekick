class IngredientSupplierJoinResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :ingredient_id, :integer
  attribute :supplier_id, :integer
  attribute :preferred_supplier, :boolean
  attribute :ingredient_cost, :string
  attribute :average_lead_time_in_days, :integer
  attribute :ingredient_inventory, :integer

  # Direct associations

  has_many   :ingredient_reviews

  belongs_to :ingredient

  belongs_to :supplier,
             resource: IngredientSupplierResource

  # Indirect associations
end
