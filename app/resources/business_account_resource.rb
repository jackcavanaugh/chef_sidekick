class BusinessAccountResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :business_name, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  # Indirect associations

end
