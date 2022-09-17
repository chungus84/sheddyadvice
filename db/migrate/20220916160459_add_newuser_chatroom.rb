class AddNewuserChatroom < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :user_one, :bigint
    add_column :chatrooms, :user_two, :bigint
  end
end
