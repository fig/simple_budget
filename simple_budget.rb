require './members'
require './groups'

# This program calculates what someone/s make per month, per year,
# and what they can afford to pay monthly for a living space

def clear_the_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end

def get_input message
  print message
  gets.chomp
end


clear_the_screen

group              = Group.new

individual_incomes = group.individual_incomes

file_name          = get_input "\n\nWhat would you like to name your budget? "
file_name          = "#{file_name}.txt"

output_file        = open(file_name, 'w')
output_file.write individual_incomes.join
output_file.write group.output_message

clear_the_screen

puts info = <<INFO
Your budget can be found in the same folder as this program:

#{Dir.pwd}

Thank you for using Simple Budget!

INFO
