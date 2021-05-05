Rails.application.routes.draw do
  get "/healthtest", to: proc { [200, {}, ["ok"]] }
  resources :posts
end
