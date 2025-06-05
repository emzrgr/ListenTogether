class UserMood < ApplicationRecord
  belongs_to :user
  belongs_to :mood
  belongs_to :music
end
