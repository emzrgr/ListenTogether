Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD=======
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  get "moods/:id/musics/new" => "musics#new"
  get "musics/:id" => "musics#show"
  post "musics" => "musics#create"
>>>>>>> 563a7502ca32c10491faccce0bbc05f32e98ec3f
end
