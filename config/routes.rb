Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  get "moods/:id/musics/new" => "musics#new"
  get "musics/:id" => "musics#show"
  post "musics" => "musics#create"

end
