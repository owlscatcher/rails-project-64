Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts

  get 'up' => 'rails/health#show', as: :rails_health_check
end
