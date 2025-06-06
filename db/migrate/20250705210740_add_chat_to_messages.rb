class AddChatToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :chat, null: true, foreign_key: true
  end
end
