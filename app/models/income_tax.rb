class IncomeTax

  def initialize(salary)
    @salary = salary
  end

  def amount
    tax = case @salary
          when 0..18200
            0
          when 18201..37000
            calculate_for_1_level
          when 37001..80000
            calculate_for_2_level
          when 80001..180000
            calculate_for_3_level
          else
            if @salary > 180000
              calculate_for_4_level
            end
          end
    tax.round
  end

  private

  def calculate_for_1_level
    ((@salary - 18200) * 0.19) / 12
  end

  def calculate_for_2_level
    (3572 + (@salary - 37000) * 0.325) / 12
  end

  def calculate_for_3_level
    (17547 + (@salary - 80000) * 0.37) / 12
  end

  def calculate_for_4_level
    (54547 + (@salary - 180000) * 0.45) / 12
  end

end
