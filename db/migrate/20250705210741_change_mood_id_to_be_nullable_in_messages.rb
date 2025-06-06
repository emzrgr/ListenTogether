class ChangeMoodIdToBeNullableInMessages < ActiveRecord::Migration[7.1]
  def change
    change_column_null :messages, :mood_id, true
  end
end
