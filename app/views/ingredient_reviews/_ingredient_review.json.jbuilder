json.extract! ingredient_review, :id, :ingredient_reviewer,
              :ingredient_supplier_join_id, :ingredient_supplier_rating, :ingredient_supplier_review_description, :created_at, :updated_at
json.url ingredient_review_url(ingredient_review, format: :json)
