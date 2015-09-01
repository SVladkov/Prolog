genNat(0).
genNat(N) :- genNat(M), N is M+1.

likes(john, mery).

between(A, B, A):-A=<B.
between(A, B, X):-A1 is A+1, A1=<B, between(A1, B, X).

fib(F) :- genNat(I), fibInd(I, F).	

fibInd(1, 1).
fibInd(0, 1).
fibInd(I, F) :- X is I-1, fibInd(X, F1), Y is I-2, fibInd(Y, F2), F is F1 + F2.