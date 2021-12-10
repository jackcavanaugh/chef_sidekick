class Menu < ApplicationRecord
  # Direct associations

  has_many   :recipe_menu_joins,
             dependent: :destroy

  belongs_to :menu_creators,
             class_name: "BusinessAccount",
             foreign_key: "menu_creator"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    menu_name
  end
end
