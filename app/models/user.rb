class User < ApplicationRecord
  has_many :user_moods, dependent: :destroy
  has_many :moods, through: :user_moods
  has_many :user_mood_musics, through: :user_moods
  has_many :chats, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
