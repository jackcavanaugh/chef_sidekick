class IngredientSupplierResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :supplier_name, :string
  attribute :supplier_description, :string
  attribute :supplier_location, :string

  # Direct associations

  # Indirect associations

end
