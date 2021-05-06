Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :authors
  resources :posts
  get "/healthtest", to: proc { [200, {}, ["ok"]] }
end
