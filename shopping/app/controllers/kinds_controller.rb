class KindsController < ApplicationController
  before_action :authenticate_user!, except: [:product]
  before_action :find_kind, except: [:index, :new, :create]

  def index
    @kinds = Kind.all
  end

  def new
    @kind = Kind.new
  end

  def create
    @kind = Kind.new(kind_param)
    if @kind.save
      redirect_to kinds_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @kind.update(kind_param)
      redirect_to kinds_path
    else
      render :edit
    end
  end

  def destroy
    @kind.products.update(kink_id: 1)
    @kind.destroy if @kind
    redirect_to kinds_path
  end

  def product
    @products = (params[:id].to_i == 1)? Product.where("amount > 0") : Product.where("amount > 0  and kind_id = '#{params[:id]}'")
    @kinds = Kind.all
    render template:  "products/index"
  end

  private
  def find_kind
    @kind = Kind.find_by(id: params[:id])
  end
  def kind_param
    params.require(:kind).permit(:name)
  end
end
