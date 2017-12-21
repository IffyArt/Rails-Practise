class UsersController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "新增成功"
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "修改成功"
    else
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
    @user.destroy if @user
    FileUtils.remove_dir("#{Rails.root}/public/uploads/user/image/#{@user.id}", :force => true)
    redirect_to users_path
  end

  private
  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :image, :image_cache, :remove_image)
  end
end
