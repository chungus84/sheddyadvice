class RemovePostFromChatroom < ActiveRecord::Migration[7.0]
  def change
    remove_column :chatrooms, :post_id
    remove_column :chatrooms, :user_id
  end
end
