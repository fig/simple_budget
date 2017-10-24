class Group

  attr_reader :number_of_people

  def initialize
    @number_of_people = get_input("How many people is this budget for? ").to_i
  end

  def create_members
    @number_of_people.times.reduce([]) do |members,user_number|
      member = Member.new user_number
      members.push member
    end
  end

  def members
    @members ||= create_members
  end

  def combined_monthly
    members.reduce(0) { |total,user| total += user.monthly_income }
  end

  def combined_annual
    members.reduce(0) { |total,user| total += user.annual_income }
  end

  def living
    combined_monthly * 0.3
  end

  def bills
    combined_monthly * 0.2
  end

  def gas
    combined_monthly * 0.2
  end

  def groceries
    combined_monthly * 0.18
  end

  def leftover
    combined_monthly - (living + bills + gas + groceries)
  end

  def individual_incomes
    members.reduce([]) { |incomes,user| incomes << "\n#{user.name} makes $#{sprintf('%.2f', user.monthly_income)} per month, and $#{sprintf('%.2f', user.annual_income)} per year." }
  end

  def output_message
    msg = <<~MSG

    Combined, this household makes $#{sprintf('%.2f', combined_monthly)} per month, and $#{sprintf('%.2f', combined_annual)} per year.

    Here is a break down of your monthly budget:
      * You can afford a living expense of $#{sprintf('%.2f', living)}.
      * You can afford $#{sprintf('%.2f', bills)} in bills.
      * You can afford $#{sprintf('%.2f', gas)} in gas.
      * You can afford $#{sprintf('%.2f', groceries)} in groceries and food.

    This leaves you with roughly $#{sprintf('%.2f', leftover)} left over
    for spending and saving.
    Keep in mind that these estimates are based on averages,
    and provide room for flexibility.
    Also remember to try and stay under budget so that
    you have more left over each month.
    MSG
  end

end
