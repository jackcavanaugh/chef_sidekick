class IngredientSupplierResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :supplier_name, :string
  attribute :supplier_description, :string
  attribute :supplier_location, :string

  # Direct associations

  has_many   :supplier_reviews,
             foreign_key: :supplier_id

  has_many   :ingredient_supplier_joins,
             foreign_key: :supplier_id

  # Indirect associations

end
