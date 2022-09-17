class AddNewColumnsFinalChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :sender_id, :integer
    add_column :chatrooms, :receiver_id, :integer
    add_foreign_key :chatrooms, :users, column: :sender_id
    add_foreign_key :chatrooms, :users, column: :receiver_id
    add_index :chatrooms, :sender_id
    add_index :chatrooms, :receiver_id
  end
end
