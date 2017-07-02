require 'test_helper'

class EmployeeAttributeProviderTest < ActiveSupport::TestCase

  def setup
    @employee_attribute_provider = EmployeeAttributeProvider.new(['Ryan','Chen','120000','10%', '01 March - 31 March'])
  end

  test "employee first name" do
    assert_equal 'Ryan', @employee_attribute_provider.first_name
  end

  test "employee last name" do
    assert_equal 'Chen', @employee_attribute_provider.last_name
  end

  test 'employee annual salary and type is integer' do
    assert_equal 120000, @employee_attribute_provider.annual_salary
  end

  test 'employee super rate and type is float percentage' do
    assert_equal 0.1, @employee_attribute_provider.super_rate
  end

  test 'employee pay period' do
    assert_equal '01 March - 31 March', @employee_attribute_provider.pay_period
  end

end
