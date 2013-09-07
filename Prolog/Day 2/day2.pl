% Finden Sie Folgendes:
% 1) Einige Implementierungen von Fibonacci-Folgen und -Brüchen. Wie
%    funktionieren sie?
fib(0,0).
fib(1,1).
fib(N,R) :- N1 is N - 1, N2 is N - 2, fib(N1,R1), fib(N2,R2), R is R1 + R2.
fibFraction(N,R) :- N1 is N+1, fib(N1,R1), fib(N,RN), R is R1/RN.
% Zuerst werden die Werte für N=0 und N=1 gesetzt. Dann wird folgende rekursive
% Regel definiert: Ist fib("N-1",R1), fib("N-2",R2), dann ist fib(N,R) mit R =
% R1 + R2.

% 2) Eine reale Community, die Prolog nutzt. Welche Probleme löst man heutzutage
%    mit der Sprache?
% Es schein, dass einige Nokia-Handys (N900, N950, N9) teilweise in Prolog
% geschriebene Software besitzen. Das voice user interface "Clarissa" auf der
% ISS wurde in Prolog geschrieben.

% Wenn Sie etwas anspruchsvolleres suche, in das Sie sich verbeißen können,
% probieren Sie es mit den folgenden Problemen:
% 1) Eine Implementierung der Türme von Hanoi. Wie funktioniert sie?
% http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/2_3.html
move(1,X,Y,_) :-  
  write('Move top disk from '), 
  write(X), 
  write(' to '), 
  write(Y), 
  nl. 
move(N,X,Y,Z) :- 
  N>1, 
  M is N-1, 
  move(M,X,Z,Y), 
  move(1,X,Y,_), 
  move(M,Z,Y,X).
% Die Lösung ist die Standard Rekursions-Lösung:
% Einen 1-stöckigen Turm kann ich einfach durch Legen der Scheibe bewegen.
% Um einen N-stöckigen Turm von X nach Y zu bewegen, bewege ich erst die oberen
% N-1 Stockwerke nach Z, das verbleibende Stockwerk von X nach Y und dann die
% "ausgelagerten" N-1 Stockwerke von Z nach Y.

% 2) Was sind einige der Probleme beim Umgang mit "Nicht"-Ausdrücken?
% 3) Warum muss man bei Prolog mit der Negation so vorsichtig sein?
% Die Negation in Prolog ist nicht die Negation der Logik im engeren Sinne,
% sondern die sog. "negation as failure". D.h. bei \+ p wird zuerst versucht, p
% zu beweisen. Schlägt dies fehlt, ist der Ausdruck wahr.
% -> closed-world assumption

% Machen Sie Folgendes:
% 1) Kehren Sie die Elemente einer Liste um.
myReverse([],[]).
myReverse([Head|Tail], ReverseList) :- myReverse(Tail,ReverseTail), append(ReverseTail,[Head],ReverseList).

% 2) Finden sie das kleinste Element einer Liste.
myMin([Head|[]], N) :- N = Head.
myMin([Head|Tail], N) :- myMin(Tail,R), N is min(Head,R).

% 3) Sortieren Sie die Elemente einer Liste.
deleteFirst(_,[],[]).
deleteFirst(X,[X|Tail],Tail).
deleteFirst(X,[Head|Tail],[Head|NewTail]) :- deleteFirst(X,Tail,NewTail).
mySort([],[]).
mySort(List,SortedList) :- SortedList = [Min|SortedRest],
                           myMin(List,Min),
                           deleteFirst(Min,List,DeletedRest),
                           mySort(DeletedRest, SortedRest).

% vim: filetype=prolog
