json.extract! order, :id, :recipe_id, :customer_comments, :created_at, :updated_at
json.url order_url(order, format: :json)
