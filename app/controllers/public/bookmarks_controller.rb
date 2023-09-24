class Public::BookmarksController < ApplicationController
  def index
    @bookmarks = current_customer.bookmarks.all
  end

  def create
    post_text = Post.find(params[:post_id])
    bookmark = current_customer.bookmarks.new(post_id: post_text.id)
    bookmark.save
    redirect_to post_path(post_text)
  end

  def destroy
    post_text = Post.find(params[:post_id])
    bookmark = current_customer.bookmarks.find_by(post_id: post_text.id)
    bookmark.destroy
    redirect_to post_path(post_text)
  end

  private
  def bookmark_params
    params.permit(:post_id, :customer_id)
  end
end
