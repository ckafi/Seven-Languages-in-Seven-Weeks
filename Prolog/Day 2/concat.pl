concatenate([], List, List).
concatenate([Head|Tail], List, [Head|C]) :- concatenate(Tail,List,C).
% vim: filetype=prolog
