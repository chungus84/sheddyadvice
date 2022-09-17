class AddForeignKeyChatroom < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :chatrooms, :users, column: :user_one
    add_foreign_key :chatrooms, :users, column: :user_two
  end
end
