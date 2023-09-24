class ChangeColumnNullOnPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :customer_id, false
  end
end
