class Payslip
  attr_accessor :employee

  def initialize(employee_attribute_provider)
    @employee = Employee.new employee_attribute_provider
  end

  def name
    "#{@employee.first_name} #{@employee.last_name}"
  end

  def pay_period
    "#{@employee.pay_period}"
  end

  def gross_income
    (@employee.annual_salary / 12).round
  end

  def income_tax
    IncomeTax.new(@employee.annual_salary).amount
  end

  def net_income
    (gross_income - income_tax).round
  end

  def super
    (gross_income * @employee.super_rate).round
  end
end
