%%%%% ALGUMAS DEFINIÇÕES PARA FUNCIONALIDADES DIVERSAS %%%%%

/*
* Organiza a tela ("limpar" tela).
*/
limpar :-
    write('\33\[2J').

/* 
* Número referente ao mês de referência.
*/
num_mes(janeiro,1).
num_mes(fevereiro,2).
num_mes(marco,3).
num_mes(abril,4).
num_mes(maio,5).
num_mes(junho,6).
num_mes(julho,7).
num_mes(agosto,8).
num_mes(setembro,9).
num_mes(outubro,10).
num_mes(novembro,11).
num_mes(dezembro,12).

/*
* Retorna o valor da chave referente ao TimeStamp (data/hora).
* (Ex.: parâmetro _Valor_ como: day; month; year; hour; minute; second).
*/
data_atual(Chave,Valor) :- 
	get_time(Stamp),
	stamp_date_time(Stamp, Data, local),
	date_time_value(Chave, Data, Valor).

/*
* Somar elementos da lista.
*/
soma_lista([],0).
soma_lista([H|T],S) :- 
	soma_lista(T,T2),
	S is H+T2.

/*
* Contar elementos da lista.
*/
tamanho_lista([],0).
tamanho_lista([_|T],N) :- 
	tamanho_lista(T,T2),
	N is T2+1.


/*
* Calcular média dos valores de uma lista.
*/
media_lista(Lista,Media) :- 
	soma_lista(Lista,Soma),
	tamanho_lista(Lista,Tamanho),
	Media is Soma/Tamanho.

/*
* Listar tamanhos de uma sublista.
* Exemplo: entrada = [[1,2,3],[3,4,5],[a,e,i,o,u]]
* saida = [3,3,5]
*/
tamanhos_sublista([],[]).
tamanhos_sublista([H|T],ListaTamanhos) :-
    tamanhos_sublista(T,F),
    tamanho_lista(H,Tam),
    ListaTamanhos = [Tam|F].

/*
* Imprime itens da lista
*/
imprime([]).
imprime([H|T]) :- 
	write(H),nl,imprime(T).

% Verifica se é uma sublista.
eh_sublista(L) :-
    tamanho_lista(L,Tam),
    Tam > 0.

% Remove um elemento da lista.
remove(X, [X|T], T).
remove(X, [H|T], [H|T1]):- remove(X,T,T1).

% Concatenar listas.
concatenar([], L, L).
concatenar([H|T], L, [H|D]) :- concatenar(T, L, D).

% ----------------------------------------------------------------------------------------------- %

%%%%% FATOS E PROPOSIÇÕES GERAIS %%%%%

/*
* Membros da familia.
* Nome e data de nascimento.
*/
membro(philip,datanasc(10,junho,1921)).
membro(charles,datanasc(14,novembro,1948)).
membro(mark_Philips,datanasc(22,setembro,1948)).
membro(timothy,datanasc(1,marco,1955)).
membro(andrew,datanasc(19,fevereiro,1960)).
membro(edward,datanasc(10,marco,1964)).
membro(peter_Philips,datanasc(15,novembro,1977)).
membro(mike,datanasc(18,outubro,1978)).
membro(william,datanasc(21,junho,1982)).
membro(harry,datanasc(15,setembro,1984)).
membro(jack,datanasc(3,maio,1986)).
membro(james,datanasc(17,dezembro,2007)).
membro(george,datanasc(22,julho,2013)).
membro(louis,datanasc(23,abril,2018)).
membro(archie,datanasc(6,maio,2019)).
membro(elizabeth_II,datanasc(21,abril,1926)).
membro(diana,datanasc(1,julho,1961)).%faleceu: 31,agosto,1997
membro(camilla,datanasc(17,julho,1947)).
membro(anne,datanasc(15,agosto,1950)).
membro(sarah,datanasc(15,outubro,1959)).
membro(sophie,datanasc(20,janeiro,1965)).
membro(autumn,datanasc(3,maio,1978)).
membro(zara,datanasc(15,maio,1981)).
membro(catherine,datanasc(9,janeiro,1982)).
membro(meghan,datanasc(4,agosto,1981)).
membro(beatrice,datanasc(8,agosto,1988)).
membro(eugenie,datanasc(23,marco,1990)).
membro(louise,datanasc(8,novembro,2003)).
membro(charlotte,datanasc(2,maio,2015)).
membro(savannah,datanasc(19,dezembro,2010)).
membro(isla,datanasc(29,marco,2012)).
membro(mia,datanasc(17,janeiro,2014)).
membro(lena,datanasc(18,junho,2018)).

/*
* Genitores.
*/
pai(philip,charles).
pai(philip,anne).
pai(philip,andrew).
pai(philip,edward).
pai(charles,william).
pai(charles,harry).
pai(mark_Philips,peter_Philips).
pai(mark_Philips,zara).
pai(andrew,beatrice).
pai(andrew,eugenie).
pai(edward,louise).
pai(edward,james).
pai(william,george).
pai(william,charlotte).
pai(william,louis).
pai(harry,archie).
pai(peter_Philips,savannah).
pai(peter_Philips,isla).
pai(mike,mia).
pai(mike,lena).

mae(elizabeth_II,charles).
mae(elizabeth_II,anne).
mae(elizabeth_II,andrew).
mae(elizabeth_II,edward).
mae(diana,william).
mae(diana,harry).
mae(anne,peter_Philips).
mae(anne,zara).
mae(sarah,beatrice).
mae(sarah,eugenie).
mae(sophie,louise).
mae(sophie,james).
mae(catherine,george).
mae(catherine,charlotte).
mae(catherine,louis).
mae(meghan,archie).
mae(autumn_Philips,savannah).
mae(autumn_Philips,isla).
mae(zara,mia).
mae(zara,lena).

/*
* Membros casados.
* Primeiro parâmetro se refere ao membro direto da família.
* Segundo parâmetro se refere ao cônjude não nobre.
*/
casados(elizabeth_II,philip).
casados(charles,camilla).
casados(anne,timothy).
casados(andrew,sarah).
casados(edward,sophie).
casados(william,catherine).
casados(harry,meghan).
casados(peter_Philips,autumn_Philips).
casados(zara,mike).
casados(eugenie,jack).

/*
* Membro possui determinada idade.
*/
idade(Membro, Idade) :-
    membro(Membro,datanasc(D,M,Y)),
    data_atual(day,Day),
    data_atual(month,Month),
    data_atual(year,Year),
    num_mes(M,Mes),
    Dif_entre_datas is (Year*365+Month*30+Day)-(Y*365+Mes*30+D),
    Idade is Dif_entre_datas//365.

/*
* Genitor (pai ou mae) de um membro.
*/
genitor(G,F) :-
    pai(G,F).
genitor(G,F) :-
    mae(G,F).

/*
* Avô/Avó de um membro.
*/
avo(A,N) :-
    genitor(A,M),
    genitor(M,N).

/*
* Avô/Avó tem neto com determinada idade.
*/
idade_neto(Avo,Neto,Idade) :-
    avo(Avo,Neto),
    idade(Neto,Idade).

/*
* Avô/Avó tem netos com determinada média de idades.
*/
idade_media_netos(Avo,MediaIdades) :-
    findall(Idade,idade_neto(Avo,_,Idade),ListaIdades),
    media_lista(ListaIdades,MediaIdades).

/*
* Avô/Avó possui neto mais novo.
*/
neto_mais_novo(Avo,Neto) :-
    findall(Idade,idade_neto(Avo,_,Idade),ListaIdades),
    min_list(ListaIdades,MenorIdade),
    idade_neto(Avo,Neto,MenorIdade).

/*
* Linha sucessora do trono.
*/
sucessor(charles,1).
sucessor(william,2).
sucessor(george,3).
sucessor(charlotte,4).
sucessor(louis,5).
sucessor(harry,6).
sucessor(archie,7).
sucessor(andrew,8).
sucessor(beatrice,9).
sucessor(eugenie,10).
sucessor(edward,11).
sucessor(james,12).
sucessor(louise,13).
sucessor(anne,14).
sucessor(peter,15).
sucessor(savannah,16).
sucessor(isla,17).
sucessor(zara,18).
sucessor(mia,19).
sucessor(lena,20).

sucessor_coroa(M,N) :-
    sucessor(M,N).

/*
* Membro possui uma lista de filhos.
*/
lista_filhos(Membro,ListaFilhos) :-
    bagof(Filho,genitor(Membro,Filho),ListaFilhos).

/*
* Membro possui uma quantidade de filhos.
*/
quantidade_filhos(Membro,Qte) :-
    lista_filhos(Membro,ListaFilhos),
    tamanho_lista(ListaFilhos,Qte).

% ----------------------------------------------------------------------------------------------- %

/**
 * Árvore que representa a família real britânica
 */
arvore(A) :-
    A = [
            elizabeth_II,
            [
                diana,
                [
                    william,
                    [
                        george,charlotte,louis
                    ],
                    catherine,harry,
                    [
                        archie
                    ],
                    meghan
                ],
                charles,camilla,mark_Philips,
                [
                    autumn,
                    [
                        savannah,isla
                    ],
                    peter_Philips,zara,
                    [
                        mia,lena
                    ],
                    mike
                ],
                anne,timothy,andrew,
                [
                    beatrice,eugenie,jack
                ],
                sarah,edward,
                [
                    louise,james
                ],
                sophie
            ],
            philip
        ].

% Imprime todos os elementos, desprezando sublistas.
imprimir_nivel([]).
imprimir_nivel([H|T]) :-
    \+ eh_sublista(H),
    write(H),nl,
    imprimir_nivel(T).
imprimir_nivel([H|T]) :-
    eh_sublista(H),
    imprimir_nivel(T).

% Concatenar listas ou ignorar elemento que não é sublista.
concatenar_listas(L1,L2,R) :-
    concatenar(L1,L2,R),!.
concatenar_listas(_,L,R) :-
    concatenar([],L,R).

% Remove todos os elementos que não são sublistas.
remove_elementos([],L,Nivel) :-
    N1 is Nivel-1,!,
    arvore_por_nivel(L,N1).
remove_elementos([H|T],L,Nivel) :-
    eh_sublista(H),!,
    concatenar_listas(H,L,L1),
    remove_elementos(T,L1,Nivel).
remove_elementos([H|T],L,Nivel) :-
    \+ tamanho_lista(H,1),
    remove_elementos(T,L,Nivel).

% Seleciona o nivel.
arvore_por_nivel(A2,0) :-
    imprimir_nivel(A2).
arvore_por_nivel(Arvore,Nivel) :-
    remove_elementos(Arvore,[],Nivel).

% Chamada da função.
imprime_arvore(0) :-
    arvore(A),
    imprimir_nivel(A).
imprime_arvore(X) :-
    X > 0,
    arvore(A),
    arvore_por_nivel(A,X).

% ----------------------------------------------------------------------------------------------- %

%%%%% CONSULTAS DE RESOLUÇÃO DO TRABALHO PRÁTICO I %%%%%

% Idade dos netos da rainha.
idade_netos_rainha :-
    findall(Idade,idade_neto(elizabeth_II,_,Idade),ListaIdades),
    write("Idade dos netos da rainha:"),nl,
    imprime(ListaIdades),nl.

% Idade média dos netos da rainha.
idade_media_netos_rainha :-
    idade_media_netos(elizabeth_II,Media),
    write("Idade media dos netos da rainha = "),
    write(Media).

% Neto mais novo de Charles.
neto_novo_charles :-
    neto_mais_novo(charles,Neto),
    write("Neto mais novo de charles: "),
    write(Neto),nl.

% Membro com mais filhos.
tem_mais_filhos(Membro) :-
    findall(Filhos,lista_filhos(_,Filhos),ListaFilhos),
    tamanhos_sublista(ListaFilhos,ListaTamanhos),
    max_list(ListaTamanhos,Maior),
    quantidade_filhos(Membro,Maior).

% Exibe linha de sucessão ao trono.
linha_sucessora :-
    sucessor_coroa(S,O),
    write(O),
    write(") "),
    write(S),nl.