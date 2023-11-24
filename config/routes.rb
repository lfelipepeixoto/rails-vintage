Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/create'
  devise_for :users
  root to: "pages#home"

  resources :cars
  get '/about', to: 'cars#about', as: 'about'
  get '/contact', to: 'cars#contact', as: 'contact'
  get '/perfil', to: 'users#perfil', as: 'perfil'
  get '/my_cars', to: 'cars#my_cars', as: 'my_cars'
  get '/policy', to: 'cars#policy', as: 'policy'

  resources :orders, only: [:new, :create]
end
