class AddColumnsChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :user_one, :integer
    add_column :chatrooms, :user_two, :integer
    add_foreign_key :chatrooms, :users, column: :user_one
    add_foreign_key :chatrooms, :users, column: :user_two
  end
end
