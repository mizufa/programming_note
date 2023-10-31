class Post < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  belongs_to :genre
  belongs_to :customer
  has_rich_text :content

  def bookmarks_by?(customer)
    bookmarks.exists?(customer_id: customer_id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "customer_id", "genre_id", "id", "text", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["bookmarks", "customer", "genre", "rich_text_content"]
  end
end