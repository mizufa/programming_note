class Post < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  belongs_to :genre
  has_rich_text :content
end
