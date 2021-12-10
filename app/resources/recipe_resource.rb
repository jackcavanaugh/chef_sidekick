class RecipeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :business_id, :integer
  attribute :recipe_name, :string
  attribute :recipe_description, :string

  # Direct associations

  # Indirect associations

end
