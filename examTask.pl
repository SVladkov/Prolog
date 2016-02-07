myMember(E, [E|T]).
myMember(E, [H|T]) :- myMember(E, T).

sameElements(A, B) :- not((myMember(E, A), not(myMember(E, B)))).

p(L, M) :- not((myMember(A, L), myMember(B, L),
				sameElements(A, B),
				not((myMember(C, M),
					not(myMember(C, A)), 
					not(myMember(C, B))
				   ))
			  )).