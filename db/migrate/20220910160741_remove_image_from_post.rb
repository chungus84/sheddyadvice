class RemoveImageFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :image, :video
  end
end
