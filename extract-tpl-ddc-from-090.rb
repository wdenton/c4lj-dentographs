#!/usr/bin/ruby

file = ARGV[0]

File.read(file).each do |line|
  line.chomp!
  begin
    call_number = (/.* \$a (.*)[$\s]/.match(line))[1]
    call_number.gsub!(/[A-Za-z\/].*/, '') # Remove any letters and slashes (/)
    puts call_number if call_number.to_i < 1000 && call_number.length > 0
  rescue Exception => e
    STDERR.puts "(Error #{e}) #{line}"
  end
end
