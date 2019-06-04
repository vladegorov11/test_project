Rails.application.routes.draw do
  resources :companies
  resources :roles
  resources :users, only: [:show, :index]
  devise_for :users, controllers: {
    invitations: 'users/invitations',
    registrations: 'users/registrations'
  }
  root to: "home#index"
end
