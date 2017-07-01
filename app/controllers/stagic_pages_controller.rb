class StagicPagesController < ApplicationController

  def home
    @payslips = []
    CSV.foreach('output.csv') {|row| @payslips <<  row} if File.file?('output.csv')
  end

end
