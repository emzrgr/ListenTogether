class RemoveMoodsFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :messages, :moods, null: false, foreign_key: true
  end
end
