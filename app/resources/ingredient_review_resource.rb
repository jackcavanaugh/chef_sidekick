class IngredientReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :ingredient_reviewer, :integer
  attribute :ingredient_supplier_join_id, :integer
  attribute :ingredient_supplier_rating, :integer
  attribute :ingredient_supplier_review_description, :string

  # Direct associations

  # Indirect associations

end
