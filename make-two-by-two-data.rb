#!/usr/bin/ruby

# Given a file of Dewey call numbers,
# output a file ready to be used
# to make a hundreds-by-tens-and-ones levelplot 
# dentogram, by printing the hundreds and
# tens-and-ones numbers separated by a space
#
# 614.59939 -> 61 45
# 598.29729 -> 59 82
# 767       -> 76 70

file = ARGV[0]

File.read(file).each do |line|
  next unless line.length > 2
  line.chomp!
  line.gsub!(/\./, '')
  line = line + "0" if line.length < 4
  first = line.slice(0,2)
  second = line.slice(2,2)
  next unless /[0-9]{2}/.match(first)
  next unless /[0-9]{2}/.match(second)
  puts "#{first} #{second}"
end
