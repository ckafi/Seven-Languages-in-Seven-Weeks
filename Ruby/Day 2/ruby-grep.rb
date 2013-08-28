line_number = 0
pattern = Regexp.new ARGV[0]

File.open(ARGV[1]).each_line do |line|
  if(line =~ pattern) then
    puts "#{line_number}: #{line}"
  end
  line_number += 1
end
