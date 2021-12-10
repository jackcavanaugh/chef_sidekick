class SupplierReview < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    chef_reviewer.to_s
  end

end
