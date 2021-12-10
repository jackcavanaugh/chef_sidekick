json.extract! ingredient_supplier_join, :id, :ingredient_id, :supplier_id, :preferred_supplier, :ingredient_cost, :average_lead_time_in_days, :ingredient_inventory, :created_at, :updated_at
json.url ingredient_supplier_join_url(ingredient_supplier_join, format: :json)
