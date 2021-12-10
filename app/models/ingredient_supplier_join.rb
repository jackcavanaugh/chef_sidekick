class IngredientSupplierJoin < ApplicationRecord
  # Direct associations

  belongs_to :supplier,
             :class_name => "IngredientSupplier"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ingredient.to_s
  end

end
