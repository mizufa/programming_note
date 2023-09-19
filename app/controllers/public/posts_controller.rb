class Public::PostsController < ApplicationController
  def index
    @post_texts = Post.all
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    text = Post.new(post_params)
    #binding.pry
    text.save
    redirect_to records_index_path #投稿履歴画面へ移動
  end

  def destroy
  end

  def update
  end

  def post_params
    params.require(:post).permit(:title, :text, :code, :content)
  end
end
