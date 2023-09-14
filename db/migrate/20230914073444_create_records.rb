class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :customer_id, null: false
      t.string :title, null: false #タイトル

      t.timestamps
    end
  end
end
