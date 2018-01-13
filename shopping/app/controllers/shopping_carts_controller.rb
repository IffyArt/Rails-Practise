class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    order = current_user.orders.create
    current_user.shopping_carts.map{|val| OrderDetail.create(order_id: order.id, product_id: val.product.id, amount: val.amount, price: val.product.price)}
    current_user.shopping_carts.destroy_all
    redirect_to shopping_carts_path, notice: "訂單成立"
  end

  def destroy
    shopping_cart = current_user.shopping_carts.find_by(id: params[:id])
    shopping_cart.product.update(amount: shopping_cart.product.amount + shopping_cart.amount)
    current_user.shopping_carts.find_by(id: params[:id]).destroy
    redirect_to shopping_carts_path
  end
end
