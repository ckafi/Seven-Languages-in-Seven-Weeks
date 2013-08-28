number = rand 1000

begin
  print "Guess my number: "
  guess = gets.to_i
  if (guess < number)
    puts "That's to low!"
  elsif (guess > number)
    puts "That's to high!"
  else
    puts "Correct!"
  end
end while (guess != number)
