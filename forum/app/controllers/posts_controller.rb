class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy] 
  before_action :find_group
  before_action :find_post, only: [:show]
  before_action :find_post_author, only: [:edit, :update, :destroy]
  before_action :member_required, only: [:new, :create ]
  def create
    @post  = @group.posts.build(post_params)  
    @post.author = current_user
    if @post.save
      redirect_to group_path(@group), notice: "文章新增成功！"
    else
      render :new
    end
  end
  
  def new
    @post  = @group.posts.new  
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    if @post.update(post_params)
      redirect_to group_path(@group), notice: "文章修改成功！"
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy if @post
    redirect_to group_path(@group), alert: "文章已刪除"
  end

  private
  def member_required
    if !current_user.is_member_of?(@group)
      flash[:warning] = "你不是這個討論版的成員，不能發文喔！"
      redirect_to group_path(@group)
    end
  end

  def find_group
    @group = Group.find_by(id: params[:group_id])
  end

  def find_post
    @post  = @group.posts.find_by(id: params[:id])    
  end

  def find_post_author
    @post = current_user.posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
