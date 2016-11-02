class StagicPagesController < ApplicationController

  def home
    employee = Employee.new(['David','Rudd','60050','9%','01 March - 31 March'])
    payslip = Payslip.new employee
    @payslips = []
    CSV.foreach('output.csv') {|row| @payslips <<  row} if File.file?('output.csv')
  end

end
