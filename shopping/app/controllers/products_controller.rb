class ProductsController < ApplicationController
  before_action :product_kind, only: [:new, :create, :edit, :update]
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    puts "\n\nKind: #{params.require(:product)}\n"
    puts "\n\nKind: #{@product.kind_id}\n"
    if @product.save
      redirect_to products_path
    else
      puts "\n\nError: #{@product.errors.full_messages}\n"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end
  
  def show
    @product = Product.includes(:product_pictures).find_by(id: params[:id])
  end
  
  def destroy
    @product.destroy if @product
    FileUtils.remove_dir("#{Rails.root}/public/uploads/product/#{@product.id}", :force => true)
    redirect_to products_path
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
