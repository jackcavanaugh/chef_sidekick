class RecipeIngredientJoinResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_id, :integer
  attribute :ingredient_id, :integer

  # Direct associations

  belongs_to :recipe

  # Indirect associations

end
