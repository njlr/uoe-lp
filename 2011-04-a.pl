% Unofficial solutions to 2011-04 programming exam
% Everything works for the given test cases


% 1

average(X, N) :- sum(X, S), length(X, L), N is S / L.

sum([X], X) :- number(X).

sum([H|T], N) :- sum(T, M), N is H + M.


% 2

% a

member2((X, Y), L, M) :- member(X, L), member(Y, M).

% The first test case given on the paper seems to be wrong!


% b

allpairs([], _, []).

allpairs(_, [], []).

allpairs(L, M, X) :- setof(P, member2(P, L, M), X).


% 3

occurs(T, X) :- var(X), var(T), T == X, !.

occurs(T, X) :- compound(T), functor(T, _, _), T =.. L, L \= [], bagof(Y, (member(Y, L), occurs(Y, X)), S), length(S, N), N > 0.


% 4

r(a, b).
r(b, c).
r(c, a).
r(c, d).
r(d, e).
r(e, f).
r(f, e).


cycle([H|T]) :- cycle(H, [H|T], []).

cycle(S, [E, S], _) :- r(E, S).

cycle(S, [A, B|T], V) :- \+ member(A, V), r(A, B), cycle(S, [B|T], [A|V]).


node(X) :- r(X, _).

node(X) :- r(_, X).


noncycle(L) :- setof(X, (node(X), \+ (cycle(C), member(X, C))), L).
