class Message < ApplicationRecord
  belongs_to :mood, optional: true
  belongs_to :chat, optional: true
end
