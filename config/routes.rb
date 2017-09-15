require 'sidekiq/web'

Rails.application.routes.draw do
  root 'dashboards#index'
  resources :users

  get 'dashboards/hello' => 'dashboards#hello'
  get 'dashboards/hi' => 'dashboards#hi'
  get 'dashboards/personalized/:name' => 'dashboards#personalized'
  get 'dashboards/reversed/:name' => 'dashboards#reversed'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'shop' => 'multipass#authenticate_store'

  get 'rentals/new/:product_id' => 'rentals#new', as: :rentals_new
  post 'rentals/new' => 'rentals#create'
  delete 'rental/:id' => 'rentals#destroy', as: :rental

  mount Sidekiq::Web, at: '/sidekiq'
end
