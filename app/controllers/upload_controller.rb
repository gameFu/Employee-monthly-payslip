class UploadController < ApplicationController

  def create
    if !params[:upload].blank? && (File.extname(file.original_filename) == '.csv')
      file =  params[:upload][:file]
      PayslipGenerator.new(file.path).generate
    end
    redirect_to root_path
  end

end
