class Message < ApplicationRecord
  belongs_to :mood
  belongs_to :chat
end
