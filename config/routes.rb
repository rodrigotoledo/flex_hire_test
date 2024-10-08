Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'user', controller: 'user', action: 'index'
    end
  end
  get 'profile', as: :profile, controller: 'profile', action: 'index'
  get 'jobs', as: :jobs, controller: 'jobs', action: 'index'
  root 'home#index'
end
