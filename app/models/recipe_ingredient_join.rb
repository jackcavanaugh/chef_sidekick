class RecipeIngredientJoin < ApplicationRecord
  # Direct associations

  belongs_to :ingredient,
             :counter_cache => true

  belongs_to :recipe,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe.to_s
  end

end
