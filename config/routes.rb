Rails.application.routes.draw do
  devise_for :users
  root to: "moods#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :moods, only: [:index, :show] do
    resources :user_mood_musics, only: [:index, :new, :create, :destroy]
    post "messages", to: "messages#generate_music", as: :generate_music_message
  end

  resources :user_moods, only: [:index, :show] do
    resources :musics, only: :show
  end

  resources :user_mood_musics, only: [:show] do
     resources :chats, only: [:show, :new, :create]
  end

  resources :chats, only: :show do
    resources :messages, only: [:index, :create]
  end

end
