#!/usr/bin/ruby

# Given a file of Dewey call numbers,
# it outputs a file ready to be used
# to make a hundreds-by-tens levelplot 
# dentogram, by printing the hundreds and
# tens numbers separated by a space
#
# 614.59939 -> 6 1
# 598.29729 -> 5 9
# 767       -> 7 6

file = ARGV[0]

File.read(file).each do |line|
  next unless line.length > 2
  line.chomp!
  hundreds = line.slice(0,1)
  tens = line.slice(1,1)
  next unless (/\d/).match(hundreds)
  next unless (/\d/).match(tens)
  puts "#{hundreds} #{tens}"
end
