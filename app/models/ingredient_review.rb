class IngredientReview < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ingredient_reviewers.to_s
  end

end
