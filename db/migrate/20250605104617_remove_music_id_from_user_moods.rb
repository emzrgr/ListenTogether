class RemoveMusicIdFromUserMoods < ActiveRecord::Migration[7.1]
  def change
    remove_column :user_moods, :music_id, :bigint
  end
end
