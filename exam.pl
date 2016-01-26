% Numbers are represented as a list of its digits. For example, the list [1, 2, 3]
% represents the number 123. Without using calculations for numbers bigger than 20
% implement a predicate sumLists(L1, L2, Result), which in Result finds the digits
% representation of the sum of L1 and L2

myAppend([], L, L).
myAppend([H|T], L, [H|T1]) :- myAppend(T, L, T1).

myReverse([], []).
myReverse([H|T], R) :- myReverse(T, R2), myAppend(R2, [H], R).

sumN(N1, N2, Result, PrevCarry, Carry) :-
	R1 is N1+N2+PrevCarry,
	Result is R1 mod 10,
	Carry is R1 // 10.

sumUp([], [], [1], 1).
sumUp(T, [], T, 0).
sumUp([], T, T, 0).
sumUp([H|T], [], Result, 1) :- sumUp([H|T], [0], Result, 1).
sumUp([], [H|T], Result, 1) :- sumUp([H|T], [0], Result, 1).
sumUp([H1|T1], [H2|T2], [H3|T3], PrevCarry) :- 
	sumN(H1, H2, H3, PrevCarry, Carry),
	sumUp(T1, T2, T3, Carry).

sumLists(L1, L2, Result) :- 
	myReverse(L1, R1),
	myReverse(L2, R2),
	sumUp(R1, R2, R3, 0),
	myReverse(R3, Result).