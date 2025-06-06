class Chat < ApplicationRecord
  belongs_to :user_mood_music
  has_many :messages, dependent: :destroy
end
