% generate(N, L) :- You are given N. Generate in L all lists of positive integers
% sorted increasingly and with sum N

generate(N, L) :- between(1, N, M), help(M, N, L).

help(M, N, [M, P|T]) :- S is N-M, between(M, N, P), help(P, S, [P|T]).
help(M, M, [M]).