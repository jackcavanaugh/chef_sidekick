class IngredientSupplier < ApplicationRecord
  # Direct associations

  has_many   :supplier_reviews,
             :foreign_key => "supplier_id",
             :dependent => :destroy

  has_many   :ingredient_supplier_joins,
             :foreign_key => "supplier_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    supplier_name
  end

end
