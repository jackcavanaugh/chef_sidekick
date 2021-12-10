class MenuResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :menu_name, :string
  attribute :menu_creator, :integer
  attribute :menu_description, :string

  # Direct associations

  belongs_to :menu_creators,
             resource: BusinessAccountResource,
             foreign_key: :menu_creator

  # Indirect associations

end
