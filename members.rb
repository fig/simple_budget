class Member

  attr_reader :name, :hourly_pay, :hours_worked

  def initialize user_number
    @name         = get_input "\n\nName of budget member ##{user_number}: "
    @hourly_pay   = get_input("How much does #{name} make an hour? $").to_i
    @hours_worked = get_input("How many hours a week does #{name} work? ").to_i
  end

  def monthly_income
    monthly_gross_income * 0.9
  end

  def annual_income
    monthly_income * 12
  end

  def monthly_gross_income
    hourly_pay * hours_worked * 4
  end

end
