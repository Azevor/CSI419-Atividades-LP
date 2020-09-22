funcao(0, 1).
funcao(1, 1).
funcao(N, F) :-
    N > 1,
    N1 is N-1,
    N2 is N-2,
    funcao(N1, F1),
    funcao(N2, F2),
    F is F1+F2.

dec_bin(0, 0).
dec_bin(1, 1).
dec_bin(D, B) :-
    D > 1,
    X is D mod 2,
    Y is D // 2,
    dec_bin(Y, B1),
    B is B1*10+X.
/*
s(X):-p(X),q(X).
s(X):-r(X).
p(a).
r(a).
q(e).
*/
s(X):-p(X),!,q(X).
s(X):-r(X).
p(a).
r(a).
q(e).

p(a, h) :-
    write('X = ['),
    write(h),
    p(c, k).
p(c, k) :-
    write(','),
    write(k),
    p(j, l).
p(j, l) :-
    write(','),
    write(l),
    write(']').

ultimo_lista([X], X).
ultimo_lista([_|T], U) :-
    ultimo_lista(T, U).