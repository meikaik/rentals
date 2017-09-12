Rails.application.routes.draw do
  resources :users

  get 'dashboards/hello' => 'dashboards#hello'
  get 'dashboards/hi' => 'dashboards#hi'
  get 'dashboards/personalized/:name' => 'dashboards#personalized'
  get 'dashboards/reversed/:name' => 'dashboards#reversed'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
