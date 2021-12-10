Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :menus

      resources :ingredient_reviews

      resources :supplier_reviews

      resources :ingredients

      resources :ingredient_suppliers

      resources :recipes

      resources :business_accounts

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
