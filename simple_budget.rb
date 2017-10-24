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

group       = Group.new

file_name   = get_input "\n\nWhat would you like to name your budget? "

output_file = open("#{file_name}.txt", 'w')
output_file.write group.individual_incomes
output_file.write group.output_message

clear_the_screen

puts info = <<INFO
Your budget can be found in the same folder as this program:

#{Dir.pwd}

Thank you for using Simple Budget!

INFO
