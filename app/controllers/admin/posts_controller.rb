class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post_text = Post.find(params[:id])
    post_text.destroy
    redirect_to admin_posts_path #投稿一覧へ移動
  end
end
