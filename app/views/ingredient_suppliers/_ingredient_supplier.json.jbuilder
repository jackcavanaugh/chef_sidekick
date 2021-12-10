json.extract! ingredient_supplier, :id, :supplier_name, :supplier_description, :supplier_location, :created_at, :updated_at
json.url ingredient_supplier_url(ingredient_supplier, format: :json)
