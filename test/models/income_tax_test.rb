require 'test_helper'

class IncomeTaxTest < ActiveSupport::TestCase

  test "payslip return employee income tax with employee annual_salary less 18200" do
    income_tax = IncomeTax.new(12000)
    assert_equal 0, income_tax.amount
  end

  test "payslip return employee income tax with employee annual_salary between $18,201 - $37,000" do
    income_tax = IncomeTax.new(36099)
    assert_equal 283, income_tax.amount
  end

  test "payslip return employee income tax with employee annual_salary between $37,001 - $80,000" do
    income_tax = IncomeTax.new(51999)
    assert_equal 704, income_tax.amount
  end

  test "payslip return employee income tax with employee annual_salary between $80,001 - $180,000" do
    income_tax = IncomeTax.new(100000)
    assert_equal 2079, income_tax.amount
  end

  test "payslip return employee income tax with employee annual_salary between $180,001 and over" do
    income_tax = IncomeTax.new(2000000)
    assert_equal 72796, income_tax.amount
  end
end
