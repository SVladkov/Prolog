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

% X is list of lists of numbers. Write a predicate that tells if two of the elements of some element of X are equal to 5
twoSubelementsAreEqualToFive(X) :- member(L, X), append(_, [A|Q], L), member(B, Q), A=5, B=5.

% X is list of lists of numbers. Write a predicate that tells if each two elements of X have at least 3 different common elements
eachTwoElementsThreeCommon(L) :- not((append(_, [X|Q], L), member(Y, Q),
									not((
										member(A, X), member(A, Y),
										member(B, X), member(B, Y),
										member(C, X), member(C, Y),
										not(A=B), not(A=C), not(B=C)
									))
								 )).
								 
% X is list of lists of numbers. Write a predicate that tells if each two elements of X have common element that is not part of some other element of X
eachTwoElementsTwoUnique(L) :- not((member(A, L), member(B, L),
									not((member(X, A), member(X, B), member(C, L),
										not(member(X, C))
									))
							   )).
							   
% take two different elements of L
takeTwo(L, A, B) :- append(_, [A|Q], L), member(B, Q).

% get continious sublist of a list
sublist(L, R) :- append(_, X, L), append( R, _, X).

% get two consecutive elements of L
consecutive(L, A, B) :- append(_, [A, B|_], L).

isSorted(L) :- not((consecutive(L, A, B), A>B)).

% take one element out of the list
out(L, E, R) :- append(A, [E|B], L), append(A, B, R).

perm(L, [E|Q]) :- out(L, E, R), perm(R, Q).
perm([], []).

subsetGen(L, [E|R]) :- out(L, E, Q), subsetGen(Q, R).
subsetGen(L, R) :- out(L, E, Q), subsetGen(Q, R).
subsetGen([],[]).

% Write quick sort
% !!! =<
split([Head|List], Element, [Head|Leftpart], Rightpart) :- Head =< Element,
	split(List, Element, Leftpart, Rightpart).
	
split([Head|List], Element, Leftpart, [Head|Rightpart]) :- Head > Element,
	split(List, Element, Leftpart, Rightpart).
	
split([], S, [], []).

quickSort([E|L], M) :-	
	%member(E, L),
	split(L, E, L1, L2),
	quickSort(L1, M1), quickSort(L2, M2),
	append(M1, [E|M2], M).
	
quickSort([],[]).

sum([H|L], S) :- sum(L, S1), S is S1+H.
sum([], 0).

% You are given lists X and Y. Generate in R all sublists of Y, such that the length of R is the same as the length of X 
% and each element of R is bigger than the corresponding element of X and the last elements of Z and Y are equal

myLast(L, E) :- append(_, [E], L).

myLength([H|L], R) :- myLength(L, R1), R is R1+1.
myLength([], 0). 

generateSublists(X, Y, P) :- sublist(Y, P), 
							myLength(P, Pl), myLength(X, Xl), Pl =:= Xl,
							myLast(P, Plast), myLast(X, Xlast), Plast =:= Xlast,
							corresponding(X, P).
							
corresponding([A|X], [B|P]) :- A=<B, corresponding(X, P).
corresponding([], []).