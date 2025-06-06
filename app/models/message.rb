class Message < ApplicationRecord
  belongs_to :mood
  belongs_to :chat, optional: true
end
