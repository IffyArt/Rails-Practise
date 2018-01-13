class CommonController < ApplicationController
  def index
    @details = ProductPicture.where(is_banner: true)
  end
end
