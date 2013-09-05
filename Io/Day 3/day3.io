// Erweitern Sie das XML-Programm um Leerzeichen, um die Einrückungsstruktur zu
// zeigen.
Builder := Object clone
Builder parseDepth := 0
Builder forward := method(
  prefix := "  " repeated(parseDepth);
  writeln(prefix, "<", call message name, ">");
  parseDepth = parseDepth + 1
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    if(content type == "Sequence", writeln("  ",prefix,content));
  )
  parseDepth = parseDepth - 1
  writeln(prefix, "</", call message name, ">")
)

Builder ul(
          li("Io"),
          li("Lua",
            ul(
              li("Javascript"),
              li("Lisp",
                ul(
                  li("C"),
                  li("Clojure"),
                  li("Fortran")
                )
              )
            )
          )
        )

// Entwickeln Sie eine Listensyntax, die eckige Klammern verwendet.
squareBrackets := method(
  data := List clone;
  call message arguments foreach(arg,
    data append(arg)
  )
)
[1,2,3] println

// Erweitern Sie das XML-Programm umd die Verarbeitung von Attributen: Ist das
// erste Argument eine Map (verwenden Sie die geschweifte-Klammer-Syntax), fügen
// Sie dem XML-Programm Attribute hinzu. Beispielsweise würde book({"author":
// "Tate"}...) als <book author="Tate">... ausgegeben.

// Erstmal die curlyBrackets Notation aus dem Buch:
OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
  r := Map clone;
  call message arguments foreach(arg,
    r doMessage(arg)
  );
  r
)
Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

Builder := Object clone
Builder parseDepth := 0
Builder forward := method(
  prefix := "  " repeated(parseDepth);
  write(prefix, "<", call message name);
  args := call message arguments;
  if(doMessage(args at(0)) type == "Map",
    m := doMessage(args removeAt(0));
    m keys foreach(k, write(" ",k,"=\"",m at(k),"\""))
  );
  writeln(">");
  parseDepth = parseDepth + 1
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    if(content type == "Sequence", writeln("  ",prefix,content));
  )
  parseDepth = parseDepth - 1
  writeln(prefix, "</", call message name, ">")
)

// Muss von einem String aus ausgewertet werden, sonst wird ':' an 'Sequence'
// gesendet.
doString("
Builder book({\"author\" : \"Tate\",\"title\":\"7Li7W\"},
          content({\"status\":\"unfinished\"},\"Hello, World!\"))
")
