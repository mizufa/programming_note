class Post < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  belongs_to :genre
end
