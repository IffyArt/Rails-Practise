class FilesController < ApplicationController
  def edit
    @file = FileRecord.find_by(id: params[:id])
  end
  
  def update
    @file = FileRecord.find_by(id: params[:id])
    @file.update(params.require(:file_record).permit(:name))
    redirect_to user_path(User.find_by(id: @file.user_id))
  end
  
  def destroy
    @file = FileRecord.find_by(id: params[:id])
    FileUtils.rm("#{Rails.root}/public/uploads/file_record/path/#{@file.id}/#{@file.path_identifier}", :force => true)
    @file.destroy if @file
    redirect_to user_path(User.find_by(id: @file.user_id))
  end
end
