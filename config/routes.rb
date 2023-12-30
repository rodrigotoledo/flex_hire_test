Rails.application.routes.draw do
  get 'profile', as: :profile, controller: 'profile', action: 'index'
  root 'home#index'
end
