# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index' # And remove the generated route `products/index`
  resource :product, only: :new# And remove the generated route `products/index`
end
