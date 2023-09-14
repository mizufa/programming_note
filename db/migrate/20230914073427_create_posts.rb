class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :genre_id, null: false
      t.string :title, null: false #タイトル
      t.text :text, null: false #投稿の説明文
      t.text :code, null: false #コード内容

      t.timestamps
    end
  end
end
