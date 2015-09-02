% path(A, B, G) :- "There is a path from A to B in the graph G"
path(A, B, G) :- pathHelp(A, B, G, Visited).

pathHelp(A, B, G, _) :- member([A, B], G).
pathHelp(A, B, G, Visited) :- not(member([A, B], G)), member([A, X], G), not(member(X, Visited)), pathHelp(X, B, G, [A|Visited]).


% p(L) :- "Every two elements X and Y of the list of lists L have a common element E, that is not a member of any other element of L"
p(L) :- not((member(X, L), member(Y, L), X \= Y, 
			 not((member(E, X), member(E, Y),
				  not((member(Z, L),
					   Z\=X, Z\=Y,
					   member(E,Z)
				  ))
			 ))
		)).
		   
% Is there (exists X from L)(foreach Y, Z from L)(exist U, V from L)(X+Y+Z+U+V = 173)?
q(L) :- member(X, L), 
		not((member(Y, L), member(Z, L),
			 not((member(U, L), member(V, L),
				  X+Y+Z+U+V is not 173
			 ))
		)).
		
% nestedSquares(L, M) :- "We are given a list of squares in L, generate the longest sublist of nested quares in M.
% A square is represented as [X, Y, A], where (X, Y) are the coordinates of the center and A is the length of the side."
nestedSquares(L, M) :- generateNestedSquareList(L, M1), not((generateNestedSquareList(L, M2)), 
															 length(M1, LM1), length(M2, LM2), 
															 M2 > M1).

generateNestedSquareList(L, M) :- append([_, M, _], L), not((append(_,[A, B|_], M), not(subSquare(A, B)))).

subSquare([Xa, Ya, A], [Xb, Yb, B]) :- Xa-(A/2) >= Xb-(B/2),
									   Ya-(A/2) >= Yb-(B/2),
									   Xa+(A/2) =< Xb+(B/2),
									   Ya+(A/2) =< Yb+(B/2).
									   
subList(List, Subl) :- append([_, Subl, _], List).

gen(X) :- between(0, 5, X).
genL(X) :- append([1, 2| X], [6, 7], [1, 2, 3, 4, 5, 6, 7]).