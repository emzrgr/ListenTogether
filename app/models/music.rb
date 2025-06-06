class Music < ApplicationRecord

  has_many :user_mood_musics
  has_many :user_moods, through: :user_mood_musics

  validates :title, :album, :artist, presence: true
  validates :title, uniqueness: true

end
