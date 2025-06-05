class AddMusicToUserMoods < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_moods, :music, null: false, foreign_key: true
  end
end
