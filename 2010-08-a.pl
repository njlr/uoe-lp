% Unofficial solutions to 2010-08 programming exam
% Everything works for the given test cases


% 1

sums([], []).

sums(L, M) :- setof(X, prefix(X, L), N), total(N, M).

total([], []).

total([[]|Xs], Ys) :- total(Xs, Ys).

total([X|Xs], [Y|Ys]) :- sum(X, Y), total(Xs, Ys).

prefix([], _).

prefix([X|Xs], [Y|Ys]) :- X = Y, prefix(Xs, Ys).

sum([], 0).

sum([H|T], N) :- sum(T, M), N is M + H.


% 2

palindrome(X) :- reverse(X, X).

reverse([], []).
reverse([X], [X]).
reverse([H|T], A) :- reverse(T, W), append(W, [H], A).


% 3

translate(X, X) :- atom(X).

translate([F|A], R) :- length(A, N), functor(T, F, N), translate(1, T, A, R).

translate(_, T, [], T).

translate(N, T, [X|Xs], R) :- M is N + 1, translate(M, T, Xs, R), translate(X, S), arg(N, R, S).


% 4

r(a, b).
r(b, c).
r(c, d).
r(d, a).
r(d, e).
r(d, f).
r(f, g).

path(X) :- path(X, []).

path([X], V) :- \+ member(X, V).

path(P, V) :-
    P = [A,B|T],
    \+ member(A, V),
    r(A, B),
    path([B|T], [A|V]).

paths(X, S) :- setof([X|T], path([X|T]), S).
