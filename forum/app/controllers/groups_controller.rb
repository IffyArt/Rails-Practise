class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy] 
  before_action :find_group, only: [:show, :join, :quit]
  before_action :find_own_group, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all
  end
  
  def create
    @group = current_user.groups.new(group_params)
    @group.owner = current_user
    if @group.save
      current_user.join! @group
      redirect_to groups_path, notice: "新增成功！"
    else
      render :new
    end
  end
  
  def new
    @group = Group.new
  end
  
  def edit
  end
  
  def show

    @posts = @group.posts
  end
  
  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: "修改成功！"
    else
      render :edit
    end
  end
  
  def destroy
    @group.destroy if @group
    redirect_to groups_path, alert: "討論板已刪除！"
  end

  def join
    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = "加入本討論版成功！"
    else
      flash[:warning] = "你已經是本討論版成員了！"
    end
    
    redirect_to group_path(@group)
  end
    
  def quit
    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash[:alert] = "已退出本討論版！"
    else
      flash[:warning] = "你不是本討論版成員，怎麼退出 XD"
    end
    
    redirect_to group_path(@group)
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end

  def find_group
    @group = Group.find_by(id: params[:id])
  end

  def find_own_group
    @group = current_user.groups.find_by(id: params[:id])
  end
end