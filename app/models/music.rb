class Music < ApplicationRecord
  has_many :user_moods
  has_many :moods, through: :user_moods
  has_many :users, through: :user_moods


  validates :title, :album, :artist, presence: true
  validates :title, uniqueness: true

end
