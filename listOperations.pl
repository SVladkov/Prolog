first(E, [E|_]).

second(E, [_, E|_]).

myLast(H, [H]).
myLast(H, [_|T]) :- myLast(H, T).

member(E, [E| _]).
member(E, [_|L]):-member(E, L).

% myLength(L, N) :- "N is the length of L"
myLength([], 0).
myLength([H|T], N) :- myLength(T, B), N is B+1.

myAppend([], X, X).
myAppend([H|T], L, [H|T1]) :- myAppend(T, L, T1).

myRemove(E, [E|T], T).
myRemove(E, [H|T], [H|L]) :- myRemove(E, T, L).

myRemove2(E, L, M) :- append(A, [E|T], L), append(A, T, M).

mySorted(L) :- not((append(A, [E,F|T], L), 
				  not(E=<F))).

mySet(L) :- not((append(A, [H|T], L), 
			   member(H, T))).
				 
trans(L) :- not((member([A,B],L), member([B,C],L), not(member([A,C],L)))).

mySubset(M, L) :- not((member(X, M), not(member(X, L)))).
				 
transposeMatrixHelp([], [], []).
transposeMatrixHelp([[H|T]|M], [H|Lh], [T|Lt]) :- transposeMatrixHelp(M, Lh, Lt).
				 
%transposeMatrix(M, T).
transposeMatrix([], []).
transposeMatrix(M, [Lh|T]) :- transposeMatrixHelp(M, Lh, Lt), transposeMatrix(Lt, T).
				 
% generate(N, L) :- You are given N. Generate in L all lists of positive integers
% sorted increasingly and with sum N

generate(N, L) :- between(1, N, M), help(M, N, L).

help(M, N, [M, P|T]) :- S is N-M, between(M, N, P), help(P, S, [P|T]).
help(M, M, [M]).

% perm(L, P) :- "P are all permutations of L"
perm([], []).
perm([H|T], P) :- perm(T, Q),
				  append(A, B, Q),
				  append(A, [H|B], P).
				  
putNOnAllPossiblePlaces(L, N, R) :- append(A, B, L),
								 append(A, [N|B], R).