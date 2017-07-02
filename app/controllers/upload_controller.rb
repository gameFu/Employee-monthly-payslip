class UploadController < ApplicationController

  def create
    if !params[:upload].blank? && upload_params.key?('file')
      file =  upload_params[:file]
      if File.extname(file.original_filename) == '.csv'
        PayslipGenerator.new(file.path, upload_params[:output_path]).generate
      else
        flash[:danger] = '文件类型错误'
      end
    else
      flash[:danger] = '没有上传文件'
    end
    redirect_to root_path
  end

  private

  def upload_params
    params.require(:upload).permit(:file, :output_path)
  end

end
