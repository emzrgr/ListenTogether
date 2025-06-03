class Mood < ApplicationRecord
  has_many :users, through: :user_moods
  has_many :musics

  validates :name, uniqueness: true
end
