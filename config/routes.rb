# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index' # And remove the generated route `products/index`
  resources :products# And remove the generated route `products/index`
end
