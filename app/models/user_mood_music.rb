class UserMoodMusic < ApplicationRecord
  belongs_to :user_mood
  belongs_to :music
  has_many :chats, dependent: :destroy
end
