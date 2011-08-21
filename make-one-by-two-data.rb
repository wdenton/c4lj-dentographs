#!/usr/bin/ruby

# Given a file of Dewey call numbers,
# output a file ready to be used
# to make a hundreds-by-tens-and-ones levelplot 
# dentogram, by printing the hundreds and
# tens-and-ones numbers separated by a space
#
# 614.59939 -> 6 14
# 598.29729 -> 5 98
# 767       -> 7 67

file = ARGV[0]

File.read(file).each do |line|
  next unless line.length > 2
  line.chomp!
  hundreds = line.slice(0,1)
  tensandones = line.slice(1,2)
  next unless (/\d/).match(hundreds)
  next unless (/\d\d/).match(tensandones)
  puts "#{hundreds} #{tensandones}"
end
