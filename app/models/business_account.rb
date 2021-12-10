class BusinessAccount < ApplicationRecord
  # Direct associations

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
