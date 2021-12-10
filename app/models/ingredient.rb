class Ingredient < ApplicationRecord
  # Direct associations

  has_many   :ingredient_supplier_joins,
             dependent: :destroy

  has_many   :recipe_ingredient_joins,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ingredient_name
  end
end
