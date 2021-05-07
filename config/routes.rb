Rails.application.routes.draw do
  root to: 'authors/posts#index'
  devise_for :authors
  get "/healthtest", to: proc { [200, {}, ["ok"]] }

  scope module: 'authors' do
    resources :posts
  end

end
