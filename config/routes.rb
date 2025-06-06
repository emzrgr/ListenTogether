Rails.application.routes.draw do
  devise_for :users
  root to: "moods#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :moods, only: [:index, :show] do
    resources :messages, only: [:new, :create]
    resources :user_mood_musics, only: [:index, :new, :create, :destroy]
  end

  resources :user_moods, only: [:index, :show]

  resources :musics, only: :show

end
