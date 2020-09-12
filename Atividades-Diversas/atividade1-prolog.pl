% Concatenar duas listas
/* ENTRADA:
* concat(Lista1, Lista2, Lista1_Lista2)
*/
concat([], L, L).
concat([H|T1], L, [H|T2]) :-
    concat(T1, L, T2).

% Inverter elementos da lista
/* ENTRADA:
* flipList(Lista_Normal, Lista_Invertida)
*/
flipList([], []).
flipList([H|T], F) :-
    flipList(T, L),
    concat(L, [H], F).

% Contar número de elementos da lista
/* ENTRADA:
* sizeList(Lista, Tamanho_Lista)
*/
sizeList([], 0).
sizeList([_|T], S) :-
    sizeList(T, C),
    S is C+1.

% Verificar se o número de elementos da lista é par
/* ENTRADA:
* countEven(Lista)
*/
countEven([]).
countEven([_, _|T]) :-
    countEven(T).

% Verificar se um elemento pertence à lista
/* ENTRADA:
* isPart(Elemento, Lista)
*/
isPart(H, [H|_]).
isPart(H, [_|T]) :-
    isPart(H, T).

% Inserir elemento na cabeça da lista
/* ENTRADA:
* insertHead(Elemento, Lista, Lista_Com_Elemento)
*/
insertHead(X, L, [X|L]).

% Verificar se lista é subconjunto de outra lista
/* ENTRADA:
* isSubGroup(SubLista, Lista)
*/
isSubGroup([], _).
isSubGroup([H|T], L) :-
    isPart(H, L),
    isSubGroup(T, L).
