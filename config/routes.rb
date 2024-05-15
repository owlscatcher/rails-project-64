Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts do
    scope module: :posts do
      resources :comments, only: %i[index edit create update destroy]
      resources :likes, only: %i[create destroy]
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
