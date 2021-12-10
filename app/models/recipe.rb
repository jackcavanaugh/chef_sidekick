class Recipe < ApplicationRecord
  # Direct associations

  has_many   :orders,
             :dependent => :destroy

  has_many   :recipe_menu_joins,
             :dependent => :destroy

  has_many   :recipe_ingredient_joins,
             :dependent => :destroy

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
