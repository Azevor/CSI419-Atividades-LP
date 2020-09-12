% Fatos para utilizar nos exemplos
pai(joao, maria).
pai(carlos, miguel).
pai(carlos, otavio).
pai(carlos, sandra).
pai(pedro, maria).
pai(bruno, helena).
pai(jose, miguel).
pai(jose, marcio).
pai(norberto, quirino).
pai(norberto, maria).
pai(tulio, otavio).

/*
* Irá gerar uma lista L dos elementos X que satisfazem a proposição Y
* eliminando itens duplicados
*/
herda(X, Y, L) :-
    setof(Y, pai(Y, X), L).

/*
* Irá gerar uma lista L de todos os elementos X que satisfazem a proposição Y
*/
herda(X, Y, L) :-
    findall(Y, pai(Y, X), L).
