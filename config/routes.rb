Rails.application.routes.draw do
  root :to => "recipes#index"
  resources :recipe_menu_joins
  resources :ingredient_supplier_joins
  resources :recipe_ingredient_joins
  resources :orders
  resources :menus
  resources :ingredient_reviews
  resources :supplier_reviews
  resources :ingredients
  resources :ingredient_suppliers
  resources :recipes
  devise_for :business_accounts
  resources :business_accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
