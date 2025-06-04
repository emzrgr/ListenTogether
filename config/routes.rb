Rails.application.routes.draw do
  devise_for :users
  root to: "moods#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :moods, only: [:index, :show] do
    resources :user_moods, only: [:new, :create]
    resources :messages, only: [:new, :create]
  end

  resources :musics, only: [:create]
  resources :user_moods, only: [:destroy]

  resources :musics, only: [:show, :create] do
    member do
      post :generate_lyrics
    end
  end
end
