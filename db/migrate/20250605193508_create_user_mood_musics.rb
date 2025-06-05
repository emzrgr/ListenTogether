class CreateUserMoodMusics < ActiveRecord::Migration[7.1]
  def change
    create_table :user_mood_musics do |t|
      t.references :user_mood, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true

      t.timestamps
    end
  end
end
