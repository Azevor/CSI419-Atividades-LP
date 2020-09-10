% Concatenar elementos da lista
concat([], L, L).
concat([H|T], L, [H|D]) :- write(H), write(T), write(L), write(D), concat(T, L, D).

% Inverter lista
flip([], []).
flip([H|T], L) :- flip(T, _), concat(H, [H], L).

% Quantidade par na lista
countEven([]).
countEven([a,a|T]) :- write(T), countEven(T).

% Item pertence à lista
isPart(H, [H|_]).
isPart(H, [_|T]) :- isPart(H, T).

% Inserir elemento na cabeça da lista
insere(H, L, [H|L]).
