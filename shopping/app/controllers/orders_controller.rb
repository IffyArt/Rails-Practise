class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, except: [:index]

  def index
    @orders = Order.all
  end
  
  def update
    if params.key? :order
      if params.require(:order).key? "rating"
        rating = params.require(:order).permit(:rating)['rating'].to_i
        user = @order.user
        user_rating = user.rating * user.rating_count
        user.update(rating_count: user.rating_count + 1, rating: (user_rating + rating) / (user.rating_count + 1))
        @order.update(rating: rating)
        redirect_to orders_path
      else
        error_list = []
        bank = params.require(:order).permit(:bank)['bank'] == ""
        bank_num = params.require(:order).permit(:bank_num)['bank_num'] == ""
        account_name = params.require(:order).permit(:account_name)['account_name'] == ""
        account = params.require(:order).permit(:account)['account'] == ""
        address = params.require(:order).permit(:address)['address'] == ""
        
        error_list << "銀行" if bank
        error_list << "銀行代碼" if bank_num
        error_list << "戶名" if account_name
        error_list << "帳號" if account
        error_list << "地址" if address
  
        if bank and bank_num and account and account_name and address
          redirect_to order_path(@order), alert: "#{error_list.join("、")}未填寫"
        else
          if @order.update(order_param)
            redirect_to orders_path
          else
            render :show
          end
        end
      end
    else
      @order.update(is_send: true)
      redirect_to orders_path
    end
  end
  
  def show  
  end
  
  def destroy
    @order.order_details.map{|detail| detail.product.update(amount: detail.amount + detail.product.amount) }
    @order.destroy if @order
    redirect_to orders_path, alert: "訂單已刪除"
  end

  private
  def find_order
    @order = (current_user.is_admin)? Order.includes(:order_details).find_by(id: params[:id]) : current_user.orders.find_by(id: params[:id])
    @order.account = account_split @order.account if @order.account != nil
  end

  def account_split account
    account_str = []
    account.each_char.each_with_index{|val, index| (index != 0 and index % 4 == 0)? account_str << "-#{val}" : account_str << "#{val}"}
    account_str.inject(:+)
  end

  def order_param
    params.require(:order).permit(:address, :memo, :is_pay, :bank, :bank_num, :account, :account_name)
  end
end
