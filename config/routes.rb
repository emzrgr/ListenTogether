Rails.application.routes.draw do
  devise_for :users
  root to: "moods#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :moods, only: [:index, :show] do
    resources :musics, only: [:new, :create]
  end
  resources :user_moods, only: [:create, :destroy]
  resources :musics, only: [:show, :create]
end

