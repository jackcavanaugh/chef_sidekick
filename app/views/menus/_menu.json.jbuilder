json.extract! menu, :id, :menu_name, :menu_creator, :menu_description,
              :created_at, :updated_at
json.url menu_url(menu, format: :json)
