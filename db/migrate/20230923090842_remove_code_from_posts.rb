class RemoveCodeFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :code, :text
  end
end
