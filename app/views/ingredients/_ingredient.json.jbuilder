json.extract! ingredient, :id, :ingredient_name, :ingredient_description,
              :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
