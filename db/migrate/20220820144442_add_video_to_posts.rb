class AddVideoToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :video, :string
  end
end
