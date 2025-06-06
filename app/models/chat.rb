class Chat < ApplicationRecord
  belongs_to :user_id
  belongs_to :mood_id
  belongs_to :music_id
  has_many :messages, dependent: :destroy
end
