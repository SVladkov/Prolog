% Problem 1: Find the last element of a list
myLast(E, [E]).
myLast(E, [_|T]) :- myLast(E, T).

% Problem 2: Find the last but one element of a list
% We will cut until we have 2 elements in the list. Then we will take the first
lastButOne(E, [E,_]).
lastButOne(E, [_,Y|T]) :- lastButOne(E, [Y|T]).

% Problem 3: Find the K-th element of a list
elementAt(X, [X|_], 1).
elementAt(X, [_|T], Index) :- Index > 1, NextIndex is Index - 1, elementAt(X, T, NextIndex).

% Problem 4: Find the length of a list
myLength(0, []).
myLength(Length, [_|T]) :- myLength(NextLength, T), Length is NextLength + 1.

% Problem 5: Reverse a list
myReverse([], []).
myReverse([H|T], Result) :- myReverse(T, TReverse), append(TReverse, [H], Result).