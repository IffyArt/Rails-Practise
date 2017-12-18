class ForumsController < ApplicationController
  before_action :find_forum, only: [:edit, :update, :destroy]
  
  def index
    @forums = Forum.all
  end
  
  def create
    @forum = Forum.new(forum_params)
    if @forum.save
      redirect_to forums_path, notice: "新增成功！"
    else
      render :new
    end
  end
  
  def new
    @forum = Forum.new
  end
  
  def edit
  end
  
  def show
    @forum = Forum.includes(:messages).find_by(id: params[:id])
  end
  
  def update
  if @forum.update(forum_params)
      redirect_to forums_path, notice: "修改成功！"
    else
      render :edit
    end
  end
  
  def destroy
    @forum.destroy if @forum
    redirect_to forums_path, notice: "刪除成功！"
  end

  private
  def find_forum
    @forum = Forum.find_by(id: params[:id])
  end

  def forum_params
    params.require(:forum).permit(:title, :description)
  end

end
