class IngredientReview < ApplicationRecord
  # Direct associations

  belongs_to :ingredient_reviewers,
             :class_name => "BusinessAccount",
             :foreign_key => "ingredient_reviewer"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ingredient_reviewers.to_s
  end

end
