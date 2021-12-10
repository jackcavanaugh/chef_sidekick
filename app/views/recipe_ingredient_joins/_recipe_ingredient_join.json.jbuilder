json.extract! recipe_ingredient_join, :id, :recipe_id, :ingredient_id, :created_at, :updated_at
json.url recipe_ingredient_join_url(recipe_ingredient_join, format: :json)
