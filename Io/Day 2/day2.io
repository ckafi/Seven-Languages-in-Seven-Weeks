// Schreiben Sie ein Programm, das die n-te Fibonacci-Zahl zurückgibt
fib := method(n,
  if(n <= 2, 1, fib(n-1) + fib(n-2))
)
fib(6) println

// Wie würden Sie / verändern, damit es 0 zurückgibt, wenn der Nenner null ist?
Number origDiv := Number getSlot("/")
Number / = method(n, if(n==0, 0, origDiv(n)))
(42 / 2) println
(42 / 0) println

// Schreiben Sie ein Programm, das alle Zahlen in einem zweidimensionalen Array
// aufsummiert.
addUp := method(a, a flatten reduce(+ ))
addUp(list(list(1,2,3),list(4,5,6),list(7,8,9))) println

// Fügen Sie in eine Liste einen Slot names myAverage ein, der den Durchschnitt
// aller Zahlen in einer Liste berechnet.
List myAverage := method(
  reduce( + ) / size
  )
list(6,7,9,10) myAverage println
// Was passiert, wenn es keine Zahlen in der Liste gibt?
// list() myAverage println // Exception: nil does not respond to '/'

// Entwickeln Sie einen Prototypen für eine zweidimensionale List. Die Methode
// dim(x,y) soll dabei eine Liste mit y Listen erzeugen, die jeweils x Elemente
// lang ist. set(x, y, wert) soll einen Wert setzen und get(x, y) einen Wert
// zurückgeben
Array2D := Object clone do(
  data := list();
  dim := method(x, y,
    for(i, 0, y-1, 
      inner := list();
      for(i, 0, x-1, inner append(0));
      data append(inner)
    );
  );
  set := method(x,y,wert,
    data at(y) atPut(x, wert)
  );
  get := method(x,y,
    data at(y) at(x)
  );
)
m := Array2D clone
m dim(2,3)
m set(1,2,42)
m get(1,2) println

// Schreiben Sie ein Programm, das ihnen 10 Versuche gibt, um eine zufällige
// Zahl zwischen 1 und 100 zu erraten. Wenn Sie wollen, können Sie Tipps wie
// "wärmer" oder "kälter" ausgeben.
lastGuess := nil
randomNumber := (Random value(99) +1) floor
10 repeat(
  "Guess my number: " print
  guess := File standardInput readLine asNumber
  if(guess == randomNumber, break)
  "Nope, that's not right." println
  if(lastGuess,
    if((randomNumber - guess) < (randomNumber - lastGuess),
      "You're getting warmer!" println,
      "You're getting colder!" println
    )
  )
  lastGuess = guess
)
if(lastGuess == randomNumber,
  "That is correct!" println,
  "Sorry, my number was " print;
  randomNumber println;
  "Maybe next time." println
)
