% Unofficial solutions to 2010-04 programming exam
% Everything works for the given test cases


% 1

differences([], []).

differences([_], []).

differences([A, B|T], [R|M]) :- R is B - A, differences([B|T], M).


% 2

evens([], []).

evens([_], []).

evens([_,B|T], [B|S]) :- evens(T, S).


% 3

atoms(T, L) :- setof(X, literal(X, T), L).

literal(X, X) :- atom(X).

literal(X, T) :- member(X, T).

literal(X, T) :- functor(T, X, _).

literal(X, T) :- compound(T), functor(T, _, N), N > 0, literal(X, T, 1).

literal(X, T, N) :- compound(T), arg(N, T, A), literal(X, A).

literal(X, T, N) :- functor(T, _, K), N > 0, N < K, M is N + 1, literal(X, T, M).


% 4

r(a, b).
r(b, c).
r(c, d).
r(d, a).
r(d, e).
r(d, f).
r(f, a).

cycle([H|T]) :- cycle(H, [H|T], []).

cycle(S, [E, S], _) :- r(E, S).

cycle(S, [A, B|T], V) :- \+ member(A, V), r(A, B), cycle(S, [B|T], [A|V]).

% With this solution cycle(X) also works for non-ground X,
% which seems to come up in other past papers.
