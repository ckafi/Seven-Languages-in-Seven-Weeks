-module(day1).
-export([count_words/1]).
-export([count_to_ten/1]).
-export([success_or_error/1]).

count_words("") -> 0;
count_words(S) -> 1+count_words(re:replace(string:strip(S),"\\w+( |$)","",[{return,list}])).

count_to_ten(10) -> io:write(10);
count_to_ten(N) -> io:write(N),count_to_ten(N+1).

success_or_error(erfolg) -> io:write("erfolg.");
success_or_error({fehler,Nachricht}) -> io:write("Fehler: "), io:write(Nachricht).
