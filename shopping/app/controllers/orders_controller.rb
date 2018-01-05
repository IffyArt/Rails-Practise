class OrdersController < ApplicationController
  before_action :find_order, except: [:index]

  def index
    @orders = Order.all
  end
  
  def update
    if params.require(:order).permit(:address)['address'] == ""
      redirect_to order_path(@order), alert: "地址未填寫"
    else
      if @order.update(order_param)
        redirect_to orders_path
      else
        render :show
      end
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
