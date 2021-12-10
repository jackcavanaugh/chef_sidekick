class BusinessAccount < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :menus,
             :foreign_key => "menu_creator",
             :dependent => :destroy

  has_many   :ingredient_reviews,
             :foreign_key => "ingredient_reviewer",
             :dependent => :destroy

  has_many   :supplier_reviews,
             :foreign_key => "reviewer",
             :dependent => :destroy

  has_many   :recipes,
             :foreign_key => "business_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
