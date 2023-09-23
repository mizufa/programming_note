class Post < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  belongs_to :genre
  belongs_to :customer
  has_rich_text :content

  def bookmarks_by?(customer)
    bookmarks.exists?(customer_id: customer.id)
  end
end