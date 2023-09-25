class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @posts = current_customer.posts.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(current_customer) #ユーザーの投稿一覧ページへリダイレクト。
  end

  def unsubscribe #退会確認画面
  end

  def withdraw #退会処理
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name, :is_deleted)
  end
end
