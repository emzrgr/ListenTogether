class Mood < ApplicationRecord
  has_many :users, through: :user_moods
  has_many :messages

  validates :name, uniqueness: true
end
