class ProductPicturesController < ApplicationController
  before_action :find_product
  before_action :authenticate_user!  

  def new
    @product_picture = ProductPicture.new
  end

  def create
    @product_picture = ProductPicture.new(picture_params)
    @product_picture.name = origin_file_name
    if @product_picture.save
      redirect_to new_product_manage_product_picture_path(@product)
    else
      render :new
    end
  end

  def destroy
    @product_picture = ProductPicture.find_by(id: params[:id])
    @product_picture.destroy if @product_picture
    redirect_to new_product_manage_product_picture_path(@product)
  end

  def update
    @product_picture = ProductPicture.find_by(id: params[:id])
    @product_picture.update(is_banner: !@product_picture.is_banner)
    redirect_to new_product_manage_product_picture_path(@product)
  end

  private
  def origin_file_name
    params.require(:product_picture).permit(:file)['file'].original_filename
  end

  def find_product
    @product = Product.includes(:product_pictures).find_by(id: params[:product_manage_id])
  end

  def picture_params
    params.require(:product_picture).permit(:product_id, :file)
  end
end
