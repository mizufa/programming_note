class Public::PostsController < ApplicationController

  def index
    #@posts = Post.page(params[:page])
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @customer = current_customer
  end

  def create
    post_text = Post.new(post_params)
    #binding.pry
    post_text.save
    redirect_to records_index_path #投稿履歴画面へ移動
  end

  def destroy
    post_text = Post.find(params[:id])
    post_text.destroy
    redirect_to records_index_path #投稿履歴画面へ移動
  end

  def update
    post_text = Post.find(params[:id])
    post_text.update(post_params)
    redirect_to post_path(post_text.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :content, :genre_id, :customer_id)
  end

end
