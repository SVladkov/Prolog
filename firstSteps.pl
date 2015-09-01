genNat(0).
genNat(N) :- genNat(M), N is M+1.

likes(john, mery).

bremove(E, [E|T], T).
bremove(E, [H|T], [H|T1]):- bremove(E, T, T1).

first(E, [E|_]).

second(E, [_, E|_]).

last1(H, [H]).
last1(H, [_|T]) :- last1(H, T).

member(E, [E| _]).
member(E, [_|L]):-member(E, L).

append([], X, X).
append([H|T], L, [H|T1]) :- append(T, L, T1).

remove1(E, [E|T], T).
remove1(E, [H|T], [H|L]) :- remove1(E, T, L).

remove2(E, L, M) :- append(A, [E|T], L), append(A, T, M).

sorted(L):-not((append(_, [E,F|_], L), not(E=<F))).

between(A, B, A):-A=<B.
between(A, B, X):-A1 is A+1, A1=<B, between(A1, B, X).

fib(F) :- genNat(I), fibInd(I, F).	

fibInd(1, 1).
fibInd(0, 1).
fibInd(I, F) :- X is I-1, fibInd(X, F1), Y is I-2, fibInd(Y, F2), F is F1 + F2.