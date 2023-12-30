Rails.application.routes.draw do
  get 'profile', as: :profile, controller: 'profile', action: 'index'
  get 'jobs', as: :jobs, controller: 'jobs', action: 'index'
  root 'home#index'
end
