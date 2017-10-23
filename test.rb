require 'fileutils'

File.delete 'test.txt' rescue ''

system "printf \"2\ntest\n5\n5\ntest2\n5\n5\ntest\n\n\" | ruby simple_budget.rb"

p FileUtils.compare_file('test.orig.txt' , 'test.txt')
