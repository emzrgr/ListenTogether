class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :user_mood_music, null: false, foreign_key: true

      t.timestamps
    end
  end
end
