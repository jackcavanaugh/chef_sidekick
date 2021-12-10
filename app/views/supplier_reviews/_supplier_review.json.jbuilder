json.extract! supplier_review, :id, :reviewer, :supplier_id, :review_title, :review_rating, :review_content, :created_at, :updated_at
json.url supplier_review_url(supplier_review, format: :json)
