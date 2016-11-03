class UploadController < ApplicationController

  def create
    if !params[:upload].blank?
      file =  params[:upload][:file]
      if File.extname(file.original_filename) == '.csv'
        PayslipGenerator.new(file.path).generate
      end
    end
    redirect_to root_path
  end

end
