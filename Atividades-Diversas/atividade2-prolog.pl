/*
* Organiza a tela ("limpar" tela)
*/
limpar :-
    write('\33\[2J').

% ----------------------------------------------------------------------------------------------- %

/*
* Mensagem de entrada de dados
*/
mensagem :-
    nl,
    write('*** INSIRA UMA LISTA DE NUMEROS INTEIROS ***'), nl,
    write('Formato: Valores separados por virgula.'), nl, nl,
    write('Exemplo de entrada: 8, 5, 9, 14.'),
    nl.

/*
* Ler inteiros da entrada e escrever no arquivo (em lista)
*/
escrever_entrada :-
    mensagem,
    criar_arquivo.

/*
* Recebe valores do teclado
*/
criar_arquivo :-
    read(Lista),
    gravar_entrada(Lista),
    write('Os valores foram armazenados no diretorio raiz (compilador).'), nl,
    write('O nome do arquivo eh "entrada.txt"'),
    nl.

/*
* Armazena uma lista no arquivo
*/
gravar_entrada(Lista) :-
    open('entrada.txt', write, Out),
    write(Out, '['),
    write(Out, Lista),
    write(Out, '].'),
    close(Out).

/*
* Somar elementos de uma lista
*/
somar_lista([], 0).
somar_lista([H|T], S) :-
    somar_lista(T, X),
    S is X+H.

/*
* Ler do arquivo (lista) do arquivo e somar os elementos
*/
somar_entrada :-
    open('entrada.txt', read, L),
        read(L, Lista), nl,
        write('Lista: '), write(Lista), nl,
        somar_lista(Lista, Soma),
        write('Soma dos elementos = '), write(Soma),
        close(L),
        nl.
