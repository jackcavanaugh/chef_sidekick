class SupplierReview < ApplicationRecord
  # Direct associations

  belongs_to :supplier,
             class_name: "IngredientSupplier"

  belongs_to :chef_reviewer,
             class_name: "BusinessAccount",
             foreign_key: "reviewer"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    chef_reviewer.to_s
  end
end
