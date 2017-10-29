require './input_output'
require './members'
require './groups'

# This program calculates what someone/s make per month, per year,
# and what they can afford to pay monthly for a living space

include InputOutput

clear_the_screen

group = Group.new

file_name = get_input "\n\nWhat would you like to name your budget? "

open("#{file_name}.txt", 'w').write group.output_message

clear_the_screen

puts info = <<INFO
Your budget can be found in the same folder as this program:

#{Dir.pwd}

Thank you for using Simple Budget!

INFO
