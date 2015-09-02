isNat(0).
isNat(N) :- N>0, M is N-1, isNat(M). 

genNat(0).
genNat(N) :- genNat(M), N is M+1.

between(A, B, A) :- A=<B.
between(A, B, N) :- A1 is A+1, A1=<B, between(A1, B, N).

% We are given a number N. Check if N is 17*(X^3) + 4*X*(Y^2) + 5*(Y^3) for some X and Y in N
p(N) :- between(0, N, X), 
		between(0, N, Y), 
		N is 17*(X^3) + 4*X*(Y^2) + 5*(Y^3).

% We are given A and B, parameters of and elipse. A is on the absciss, B is on the ordinate. Generate all points with integer coordinates in the elipse.
elipse(A, B, X, Y) :- A1 is -A, between(A1, A, X), 
						B1 is -B, between(B1, B, Y), 
						(X^2)/(A^2) + (Y^2)/(B^2) =< 1.
						
% fibN(N, F) :- "generates the N-th Fibonacci number."
fibN(1, 1).
fibN(0, 1).
fibN(N, F) :- X is N-1, fibN(X, F1), 
			  Y is N-2, fibN(Y, F2),
			  F is F1 + F2.
			  
fib(F) :- genNat(N), fibN(N, F).

% pyth(X, Y, Z) :- "Generates all Pythagorean triples"
pyth(X, Y, Z) :- genNat(Z), between(1, Z, X), between(1, Z, Y), Z is (X*X + Y*Y)/Z.