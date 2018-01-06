class OrdersController < ApplicationController
  before_action :find_order, except: [:index]
  # To Do
  # 1. 評分 （含買家與賣家）
  # 2. 更改買家評分
  # 3. 評分的list

  def index
    @orders = Order.all
  end
  
  def update
    if params.key? :order
      if params.require(:order).permit(:address)['address'] == ""
        redirect_to order_path(@order), alert: "地址未填寫"
      else
        if @order.update(order_param)
          redirect_to orders_path
        else
          render :show
        end
      end
    else
      @order.update(is_send: true)
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
    @order = current_user.orders.find_by(id: params[:id])
  end

  def order_param
    params.require(:order).permit(:address, :memo, :is_pay)
  end
end
