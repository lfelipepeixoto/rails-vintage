Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cars
  get '/about', to: 'cars#about', as: 'about'
  get '/contact', to: 'cars#contact', as: 'contact'
end
