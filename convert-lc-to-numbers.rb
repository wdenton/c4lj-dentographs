#!/usr/bin/env ruby

data_file = ARGV[0]

# First, make a hash that maps LC class letters to numbers
map_file = 'lc-map.txt'

lcmap = {}

# Write out a 0 entry for each LC class letter,
# so that the number of things on the x-axis is
# constant for all libraries.  (If a library only
# has things in Q, then they need to line up with
# what other libraries have in Q, not be all jammed
# up against the y-axis because there's nothing from
# A-P.)
File.open(map_file).each_with_index do |class_letters, i|
  lcmap[class_letters.chomp] = i
  puts "#{i} 0"
end

# Mark the y-axis all the way out to 10,000
10000.times do |i|
  puts "0 #{i}"
end
#puts "0 10000"

File.open(data_file).each do |lc|
  callNum = lc.split
  next unless lcmap[callNum[0]] # Avoid K and strange letters
  next unless callNum[1]
  next unless callNum[1].to_i < 10000 # Avoid strangely large numbers
  puts "#{lcmap[callNum[0]]} #{callNum[1]}"
end
