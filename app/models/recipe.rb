class Recipe < ApplicationRecord
  # Direct associations

  belongs_to :chef,
             :class_name => "BusinessAccount",
             :foreign_key => "business_id",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    chef.to_s
  end

end
