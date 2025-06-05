class UserMoodMusic < ApplicationRecord
  belongs_to :user_mood
  belongs_to :music
end
