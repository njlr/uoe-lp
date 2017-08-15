% Unofficial solutions to 2011-08 programming exam
% Everything works for the given test cases


% 1

last(L, X) :- L = [X|[]].

last([_|T], X) :- last(T, X).


% 2

dotproduct([], [], 0).

dotproduct([X|Xs], [Y|Ys], M) :- length(Xs, N), length(Ys, N), dotproduct(Xs, Ys, P), M is (P + (X * Y)).


% 3

edge(edi, gla, 50).
edge(obn, gla, 80).
edge(str, per, 30).

edge(edi, per, 40).
edge(obn, inv, 100).
edge(per, inv, 120).

edge(edi, dun, 90).
edge(edi, str, 30).
edge(str, dun, 60).

edge(inv, abd, 70).
edge(gla, str, 30).
edge(dun, abd, 70).


% a

undirected_edge(A, B, C) :- edge(A, B, C).

undirected_edge(A, B, C) :- edge(B, A, C).


% b

path(A, B, P) :- path(A, B, P, [A]).

path(A, B, [A, B], _) :- A \= B, undirected_edge(A, B, _).

path(A, B, [A, H|T], V) :- undirected_edge(A, H, _), \+ member(H, V), path(H, B, [H|T], [H|V]).


% c

pathcost([A, B], C):- undirected_edge(A, B, C).

pathcost([A, B|T], X) :- undirected_edge(A, B, C), pathcost([B|T], Y), X is C + Y.


% d

shortest(A, B, P) :- setof(X, path(A, B, X), S), shortest(P, S).

shortest(P, S) :- member(P, S), pathcost(P, X), \+ (member(Q, S), pathcost(Q, Y), Y < X).


% e

subterms(T, S) :- setof(X, subterm(X, T), S).

subterm(T, T).

subterm(X, T) :- compound(T), functor(T, F, _), T =.. [F|A], member(Y, A), subterm(X, Y).


% Generates terms in a different order to the test cases given...
% seems to work fine though.
