class AddTasktoMessages < ActiveRecord::Migration[7.1]
  def change
     add_column :messages, :task, :string
  end
end
