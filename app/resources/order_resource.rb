class OrderResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_id, :integer
  attribute :customer_comments, :string

  # Direct associations

  belongs_to :recipe

  # Indirect associations

end
