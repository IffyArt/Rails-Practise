class ShoppingCartsController < ApplicationController
  def index
  end

  def create
    order = current_user.orders.create
    current_user.shopping_carts.map{|val| OrderDetail.create(order_id: order.id, product_id: val.product.id, amount: val.amount, price: val.product.price)}
    current_user.shopping_carts.destroy_all
    redirect_to shopping_carts_path
  end

  def destroy
    current_user.shopping_carts.find_by(id: params[:id]).destroy
    redirect_to shopping_carts_path
  end
end
