class RecipeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :business_id, :integer
  attribute :recipe_name, :string
  attribute :recipe_description, :string

  # Direct associations

  has_many   :recipe_menu_joins

  has_many   :recipe_ingredient_joins

  belongs_to :chef,
             resource: BusinessAccountResource,
             foreign_key: :business_id

  # Indirect associations

end
