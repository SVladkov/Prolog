% L=[a1, a2, ..., an] represents a the digits of the decimal number a1a2...an. For example L=[1, 2, 3, 4] represents 1234.
% Without using prolog's arithmetic operations for numbers larger than 100, write a predicate that in the list Y stores the 
% representation of L multiplied by 7.

% q(X, Y) :- myReverse(X, R) p-help(R, Y, 0).

myReverse([], []).
myReverse([H|T], L) :- myReverse(T, R1), append(R1, [H], L).

splitNumber(X, D, E) :- E is X mod 10,
						D is X//10.
						
cutHead([H|T], H, T).