class RecipeMenuJoin < ApplicationRecord
  # Direct associations

  belongs_to :recipe

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    menu.to_s
  end

end
