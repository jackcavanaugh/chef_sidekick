class RecipeMenuJoinResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :menu_id, :integer
  attribute :recipe_id, :integer

  # Direct associations

  belongs_to :menu

  belongs_to :recipe

  # Indirect associations
end
