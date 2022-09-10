class AddPostToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :post, null: false, foreign_key: true
  end
end
