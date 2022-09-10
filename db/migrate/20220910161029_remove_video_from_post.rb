class RemoveVideoFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :video
  end
end
