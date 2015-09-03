% q(X, Y) :- myReverse(X, R) p-help(R, Y, 0).

myReverse([], []).
myReverse([H|T], L) :- myReverse(T, R1), append(R1, [H], L).

splitNumber(X, D, E) :- E is X mod 10,
						D is X//10.
						
cutHead([H|T], H, T).