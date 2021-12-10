class BusinessAccountResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :business_name, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :menus,
             foreign_key: :menu_creator

  has_many   :ingredient_reviews,
             foreign_key: :ingredient_reviewer

  has_many   :supplier_reviews,
             foreign_key: :reviewer

  has_many   :recipes,
             foreign_key: :business_id

  # Indirect associations
end
