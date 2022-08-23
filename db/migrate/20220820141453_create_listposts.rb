class CreateListposts < ActiveRecord::Migration[7.0]
  def change
    create_table :listposts do |t|
      t.references :post, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
