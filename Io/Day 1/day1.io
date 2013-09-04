// Beantworten Sie folgende Fragen:

// Evaluieren Sie 1+1 und dann 1+ "one". Ist Io stark oder schwach typisiert?
// Untermauern Sie Ihre Antwort mit Code.
(1 + 1) println
// 1 + "one" schmeisst 
// Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
// D.h. kein impizietes Casting, daher stark typisiert.

// Ist 0 wahr oder falsch? Was ist mit dem Leerstring? Ist nil wahr oder
// falsch? Untermauern sie Ihre Antwort mit Code.
("0 is " .. if(0)) println      // true
("\"\" is " .. if("")) println  // true
("nil is " .. if(nil)) println  // false

// Wie können Sie die von einem Prototyp unterstützten Slots ermitteln?
Human := Object clone
ww := Human clone do(
  lastname ::= "White"
  firstname ::= "Walter"
)
(ww slotNames) println

// Was ist der Unterschied zwischen '=', ':=' und '::='? Wann benutzen sie was?
// '=' updatet einen schon vorhandenen Slot. ':=' erzeugt und initialisiert
// einen neuen Slot. '::=' ebenso, allerdings wird automatisch eine
// setter-Methode angelegt. Letzteres sollte immer verwendet werden, außer beim
// Zuweisen von Methoden.


// Machen Sie Folgendes:

// Führen Sie ein Io-Programm aus einer Datei aus.
// io day1.io

// Führen Sie den Code in einem Slot über dessen Namen aus.
ww doWork := method("Lets cook." println)
ww getSlot("doWork") call
