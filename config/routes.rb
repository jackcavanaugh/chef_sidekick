Rails.application.routes.draw do
  resources :supplier_reviews
  resources :ingredients
  resources :ingredient_suppliers
  resources :recipes
  devise_for :business_accounts
  resources :business_accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
