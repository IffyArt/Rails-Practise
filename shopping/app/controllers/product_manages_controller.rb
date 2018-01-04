class ProductManagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  
  before_action :find_product, only: [:edit, :update, :destroy]
  before_action :product_kind, only: [:new, :create, :edit, :update]

  def index
    @products = Product.all
  end
  
  def destroy
    @product.destroy if @product
    FileUtils.remove_dir("#{Rails.root}/public/uploads/product/#{@product.id}", :force => true)
    redirect_to product_manages_path
  end
  
  private
  def product_kind
    @kinds = Kind.all
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :discounted, :discounted_start_date, :discounted_end_date, :amount, :description, :content, :kind_id, :image)
  end
end
