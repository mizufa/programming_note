class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :genre_name, null: false #ジャンル名

      t.timestamps
    end
  end
end
