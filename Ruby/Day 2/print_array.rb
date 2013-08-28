i = 1
a = (1..16).to_a

a.each do |num|
  print num
  print i%4 == 0 ? "\n" : ", "
  i += 1
end

puts

a.each_slice(4) do |slice|
  puts slice.join(", ")
end
