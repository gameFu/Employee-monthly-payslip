require 'test_helper'

class PayslipTest < ActiveSupport::TestCase

  def setup
    employee = Employee.new(['David','Rudd','60050','9%', '01 March – 31 March'])
    @payslip = Payslip.new employee
  end

  test "payslip return employee name" do
    assert_equal 'David Rudd', @payslip.name
  end

  test "payslip return employee pay period" do
    assert_equal '01 March – 31 March', @payslip.pay_period
  end

  test "payslip return employee gross_income" do
    assert_equal (@payslip.employee.annual_salary / 12), @payslip.gross_income
  end

  test "payslip return employee income tax with employee annual_salary less 18200" do
    @payslip.employee.annual_salary = 12000
    assert_equal 0, @payslip.income_tax
  end

  test "payslip return employee income tax with employee annual_salary between $18,201 - $37,000" do
    @payslip.employee.annual_salary = 36099
    assert_equal 283, @payslip.income_tax
  end

  test "payslip return employee income tax with employee annual_salary between $37,001 - $80,000" do
    @payslip.employee.annual_salary = 51999
    assert_equal 704, @payslip.income_tax
  end

  test "payslip return employee income tax with employee annual_salary between $80,001 - $180,000" do
    @payslip.employee.annual_salary = 100000
    assert_equal 2079, @payslip.income_tax
  end

  test "payslip return employee income tax with employee annual_salary between $180,001 and over" do
    @payslip.employee.annual_salary = 2000000
    assert_equal 72796, @payslip.income_tax
  end

  test "payslip return employee net_income" do
    assert_equal 4082, @payslip.net_income
  end

  test "payslip return employee super" do
    assert_equal 450, @payslip.super
  end

end
