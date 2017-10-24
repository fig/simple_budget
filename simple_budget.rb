# This program calculates what someone/s make per month, per year,
# and what they can afford to pay monthly for a living space


def clear_the_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end

def get_input message
  print message
  $stdin.gets.chomp
end

def monthly_income(hourly_pay, hours_worked)
  monthly_gross_income = hourly_pay * hours_worked * 4
  monthly_gross_income - (monthly_gross_income * 0.10)
end

def annual_income(monthly_net_income)
  monthly_net_income * 12
end

def combined_monthly(number_of_people, members)
  combined_monthly = 0
  if number_of_people > 1
    members.each do |user|
      combined_monthly += user[:monthly_income]
    end
  elsif
    combined_monthly += members[0][:monthly_income]
  end
  combined_monthly
end

def combined_annual(number_of_people, members)
  combined_annual = 0
  if number_of_people > 1
    members.each do |user|
      combined_annual += user[:annual_income]
    end
  elsif
    combined_annual += members[0][:annual_income]
  end
  return combined_annual
end

def member_register(user)
  member = {}

  member_name  = get_input "\n\nName of budget member ##{user}: "
  hourly_pay   = get_input("How much does #{member_name} make an hour? $").to_i
  hours_worked = get_input("How many hours a week does #{member_name} work? ").to_i

  monthly_net_income = monthly_income(hourly_pay, hours_worked)
  annual_income = annual_income(monthly_net_income)

  member[:name] = member_name
  member[:monthly_income] = monthly_net_income
  member[:annual_income] = annual_income
  return member
end

def member_register_loop(number_of_people)
  # This creates an empty array called "members"
  members = []
  (1..number_of_people).each do |user|
    # This runs the "member_register" function and stores the output hash
    # inside the variable "member"
    member = member_register(user)

    members.push(member)
  end
  members
end

def individual_incomes_message(members)
  individual_incomes = []
  members.each do |user|
    message =  "\n#{user[:name]} makes $#{sprintf('%.2f', user[:monthly_income])} per month, and $#{sprintf('%.2f', user[:annual_income])} per year."

    individual_incomes << message
  end
  individual_incomes
end

def write_to_output_file(number_of_people, individual_incomes, output_budget_text_file, budget_message)
  (0...number_of_people).each do |user|
    output_budget_text_file.write(individual_incomes[user])
  end
  output_budget_text_file.write(budget_message)
end

clear_the_screen

number_of_people   = get_input("How many people is this budget for? ").to_i
members            = member_register_loop(number_of_people)
combined_monthly   = combined_monthly(number_of_people, members)
combined_annual    = combined_annual(number_of_people, members)

living             = combined_monthly * 0.3
bills              = combined_monthly * 0.2
gas                = combined_monthly * 0.2
groceries          = combined_monthly * 0.18
leftover           = combined_monthly - (living + bills + gas + groceries)

individual_incomes = individual_incomes_message(members)

budget_message = <<MSG

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

output_file_name = get_input "\n\nWhat would you like to name your budget? "
output_file_name = "#{output_file_name}.txt"

output_budget_text_file = open(output_file_name, 'w')

write_to_output_file(number_of_people, individual_incomes, output_budget_text_file, budget_message)

output_budget_text_file.close

puts "\n\n\nYour budget can be found in the same folder as this program: \n\n#{Dir.pwd}\n\n\n\n"

puts "Thank you for using Simple Budget!\n\n"

get_input ''

clear_the_screen
