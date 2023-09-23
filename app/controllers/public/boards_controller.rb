class Public::BoardsController < ApplicationController

def index
  @q = Board.ransack(params[:q])
  @boards = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
end

end
