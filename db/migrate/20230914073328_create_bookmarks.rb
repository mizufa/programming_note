class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :post_id, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end
  end
end
