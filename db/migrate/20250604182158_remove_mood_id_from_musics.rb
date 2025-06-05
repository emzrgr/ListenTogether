class RemoveMoodIdFromMusics < ActiveRecord::Migration[7.1]
  def change
    remove_reference :musics, :mood, index: true
  end
end
