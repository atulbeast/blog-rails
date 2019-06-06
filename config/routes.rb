Rails.application.routes.draw do
  resources :articles
  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
