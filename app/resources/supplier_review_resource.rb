class SupplierReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :reviewer, :integer
  attribute :supplier_id, :integer
  attribute :review_title, :string
  attribute :review_rating, :integer
  attribute :review_content, :string

  # Direct associations

  # Indirect associations

end
