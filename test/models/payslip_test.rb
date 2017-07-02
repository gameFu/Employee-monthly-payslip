require 'test_helper'

class PayslipTest < ActiveSupport::TestCase

  def setup
    employee = EmployeeAttributeProvider.new(['David','Rudd','60050','9%', '01 March – 31 March'])
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

  test "payslip return employee net_income" do
    assert_equal 4082, @payslip.net_income
  end

  test "payslip return employee super" do
    assert_equal 450, @payslip.super
  end

end
