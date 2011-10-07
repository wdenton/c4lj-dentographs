#!/usr/bin/ruby

# Given a file filled with 949 fields, dump out
# BRANCH:CALL_NUMBER
#
# Input should look like
# 949    $a JL65 1954 .M34 1976 ERI $w LC $c 1 $i 31761035750132 $l STACKS $m ROBARTS $r Y $s Y $t BOOK $u 11/6/1993
# 949    $a B1246 .S7 $w LC $c 1 $i 34444000259283 $l STORAGE $m ROBARTS $r Y $s Y $t BOOK $u 12/8/1994
#
# Output will be
#
# ROBARTS:JL 65
# ROBARTS:B 1246

file = ARGV[0]

File.open(file).each_with_index do |line, index|
  h = Hash.new
  line.split("$").each do |part|
    next unless /[a-z]/.match(part[0,1]) # Skip the 949
    subfield = part[0,1]
    subfield_value = part[2..-1]
    h[subfield] = subfield_value.strip
  end
  callNum = h['a']
  branch = h['m']
  scheme = h['w']
  next unless scheme == "LC" # Ignore maps, gov docs, other special classifications

  begin
    callNum.gsub!(/\..*/, '') # Remove everything after the first decimal point
    callNum.strip.upcase!
    m = /([A-Z]+)(\d+)/.match(callNum)
    next if m.nil? # Skip the rare call number with letters but no numbers
    next if m[1].nil?
    next unless m[2].to_i > 0
    puts branch + ":" + m[1] + " " + m[2]
  rescue Exception => e
    # STDERR.puts "Skipped #{callNum}: #{e}"
  end
end
