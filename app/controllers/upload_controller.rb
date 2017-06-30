class UploadController < ApplicationController

  def create
    if !params[:upload].blank?
      file =  params[:upload][:file]
      if File.extname(file.original_filename) == '.csv'
        PayslipGenerator.new(file.path).generate
      else
        flash[:danger] = '文件类型错误'
      end
    else
      flash[:danger] = '没有上传文件'
    end
    redirect_to root_path
  end

end
