Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/new'

  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
end