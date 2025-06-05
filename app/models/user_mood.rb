class UserMood < ApplicationRecord
  belongs_to :user
  belongs_to :mood
  has_many :user_mood_musics, dependent: :destroy
  has_many :musics, through: :user_mood_musics
end
