class Group

  attr_reader :members

  def initialize
    @number_of_people = get_input("How many people is this budget for? ").to_i
    @members = create_members
  end

  def create_members
    @number_of_people.times.reduce([]) { |members,user_number| members.push Member.new user_number }
  end

  def combined_monthly_income
    @combined_monthly_income ||= members.reduce(0) { |total,user| total += user.net_monthly_income }
  end

  def combined_annual_income
    members.reduce(0) { |total,user| total += user.annual_income }
  end

  def living
    combined_monthly_income * 0.3
  end

  def bills
    combined_monthly_income * 0.2
  end

  def gas
    combined_monthly_income * 0.2
  end

  def groceries
    combined_monthly_income * 0.18
  end

  def leftover
    combined_monthly_income - (living + bills + gas + groceries)
  end

  def individual_incomes
    members.reduce([]) { |i,u| i << "\n#{u.name} makes $#{'%.2f' % u.net_monthly_income} per month, and $#{'%.2f' % u.annual_income} per year." }
  end

  def output_message
    individual_incomes.join + aggregate_output_message
  end

  def aggregate_output_message
    msg = <<~MSG

    Combined, this household makes $#{'%.2f' % combined_monthly_income} per month, and $#{'%.2f' % combined_annual_income} per year.

    Here is a break down of your monthly budget:
      * You can afford a living expense of $#{'%.2f' % living}.
      * You can afford $#{'%.2f' % bills} in bills.
      * You can afford $#{'%.2f' % gas} in gas.
      * You can afford $#{'%.2f' % groceries} in groceries and food.

    This leaves you with roughly $#{'%.2f' % leftover} left over
    for spending and saving.
    Keep in mind that these estimates are based on averages,
    and provide room for flexibility.
    Also remember to try and stay under budget so that
    you have more left over each month.
    MSG
  end

end
