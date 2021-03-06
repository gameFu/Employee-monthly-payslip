require 'csv'

class PayslipGenerator
  attr_reader :input_path, :output_path
  def initialize(input_path = 'input.csv', output_path = 'output.csv')
    if input_path.present? && File.exist?(input_path)
      @input_path = input_path
      @output_path = output_path.present? ? output_path : 'output.csv'
    else
      raise PayslipGeneratorError, "Input CSV file not specified."
    end
  end

  def generate
    File.write(@output_path, payslip_parse)
  end

  private
  def payslip_parse
    payslip_csv = ""
    CSV.foreach(input_path) do |employee_row|
      employee = EmployeeAttributeProvider.new employee_row
      payslip = Payslip.new employee
      payslip_details = [payslip.name, payslip.pay_period, payslip.gross_income,
        payslip.income_tax, payslip.net_income, payslip.super]
      payslip_csv << CSV.generate_line(payslip_details, {})
    end
    payslip_csv
  end

end

class PayslipGeneratorError < StandardError; end
