# Zusatzaufgabe: Wenn es Ihnen nach ein wenig mehr gelüstet, schreiben Sie ein
# Programm, das sich eine Zufallszahl aussucht. Lassen Sie den Spieler die Zahl
# raten und sagen Sie ihm, ob er zu hoch oder zu niedrig liegt.

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
