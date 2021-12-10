Rails.application.routes.draw do
  devise_for :business_accounts
  resources :business_accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
