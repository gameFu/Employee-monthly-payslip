class Employee
  def initialize(employee_attribute_provider)
    @employee_attribute_provider = employee_attribute_provider
  end

  delegate :first_name, :last_name, :annual_salary, :super_rate, :pay_period, to: :employee_attribute_provider

  private

  attr_reader :employee_attribute_provider
end
