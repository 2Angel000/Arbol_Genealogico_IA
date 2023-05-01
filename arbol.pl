:- writeln('Iniciando programa...\n
================================================\n
Instructor: Isidro Carbajal Miranda\n
Materia: Inteligencia Artificial\n
Alumno: Florencio Martínez Miguel Ángel\n
Matricula: 19520312\n
Carrera: Ingeniería en sistemas Computacionales\n
Grupo: S8A\n
Horario 11:00 AM - 12:00 PM\n
================================================
').
:- writeln('Hola, estas son algunas instrucciones que puedes utilizar en este programa:\n 
hombre(X).\n
mujer(Y).\n
abuela(Abuela,Nieto).\n
abuelo(Abuelo,Nieto).\n
tia(Tia,Sobrinos).\n
tio(Tio,Sobrinos).\n
papa(Papa,Hijo).\n
mama(Mama,Hijo).\n
primo(Primo,De).\n
prima(Prima,De).\n
; para continuar con un resultado
. Para terminar la sentencia').

mujer(felipa).
mujer(josefina).
mujer(luisa).
mujer(laura).
mujer(araceli).
mujer(carmen).
mujer(blanca).
hombre(rufino).
hombre(maximino).
hombre(rafael).
hombre(joaquin).
hombre(jose).
hombre(angel).

% abuelos maternos
:- discontiguous abuelo/2.
abuelo(rufino, jose).
abuelo(rufino, angel).
abuelo(rufino, laura).
abuelo(rufino, araceli).
:- discontiguous abuela/2.
abuela(felipa, jose).
abuela(felipa, angel).
abuela(felipa, laura).
abuela(felipa, araceli).

% abuelos paternos
:- discontiguous abuelo/2.
abuelo(maximino, jose).
abuelo(maximino, angel).
abuelo(maximino, laura).
abuelo(maximino, araceli).
abuelo(maximino, blanca).
:- discontiguous abuela/2.
abuela(josefina, jose).
abuela(josefina, angel).
abuela(josefina, laura).
abuela(josefina, araceli).
abuela(josefina, blanca).

% padres de padres
    % maternos
    :- discontiguous mama/2.
    mama(felipa, luisa).
    :- discontiguous papa/2.
    papa(rufino, luisa).

    % paternos
    :- discontiguous mama/2.
    mama(josefina, rafael).
    :- discontiguous papa/2.
    papa(maximino, rafael).
    :- discontiguous mama/2.
    mama(josefina, carmen).
    :- discontiguous papa/2.
    papa(maximino, carmen).

% matrimonios
    % matrimonio de abuelos
        % maternos
        :- discontiguous esposo/2.
        esposo(rufino, felipa).
        :- discontiguous esposa/2.
        esposa(felipa, rufino).
    
        %paternos
        :- discontiguous esposo/2.
        esposo(maximino, josefina).
        :- discontiguous esposa/2.
        esposa(josefina, maximino).
    
    % matrimonios de padres
    :- discontiguous esposo/2.
    esposo(rafael, luisa).
    :- discontiguous esposa/2.
    esposa(luisa, rafael).
    
    %matrimonios de tios
    :- discontiguous esposo/2.
    esposo(joaquin, carmen).
    :- discontiguous esposa/2.
    esposa(carmen, joaquin).

% padres
    % familia 1
    :- discontiguous mama/2.
    mama(luisa, jose).
    mama(luisa, angel).
    mama(luisa, laura).
    mama(luisa, araceli).

    :- discontiguous papa/2.
    papa(rafael, jose).
    papa(rafael, angel).
    papa(rafael, laura).
    papa(rafael, araceli).


    % familia 2
    :- discontiguous mama/2.
    mama(carmen, blanca).
    :- discontiguous papa/2.
    papa(joaquin, blanca).

% hermanos
:- discontiguous hermana/2.
hermana(carmen, rafael).
:- discontiguous hermano/2.
hermano(rafael, carmen).

hermano(jose, angel).
hermano(jose, laura).
hermano(jose, araceli).
    
hermano(angel, jose).
hermano(angel, laura).
hermano(angel, araceli).

:- discontiguous hermana/2.
hermana(araceli, laura).
hermana(araceli, jose).
hermana(araceli, angel).

hermana(laura, jose).
hermana(laura, angel).
hermana(laura, araceli).

%  primos
:- discontiguous primo/2.
primo(jose, blanca).
primo(angel, blanca).
:- discontiguous prima/2.
prima(laura, blanca).
prima(araceli, blanca).

prima(blanca, jose).
prima(blanca, angel).
prima(blanca, laura).
prima(blanca, araceli).

% tios
:- discontiguous tio/2.
tio(rafael, blanca).
:- discontiguous tia/2.
tia(luisa, blanca).
:- discontiguous tio/2.
tio(joaquin, jose).
tio(joaquin, angel).
tio(joaquin, laura).
tio(joaquin, araceli).
:- discontiguous tia/2.
tia(carmen, jose).
tia(carmen, angel).
tia(carmen, laura).
tia(carmen, araceli).

abuelo(X,Y) :- papa(X,Z), papa(Z,Y). %(X es el abuelo de Y si hay un papa de Z que es papa de Y)
abuelo(X,Y) :- papa(X,Z), mama(Z,Y). %(X es el abuelo de Y si hay un papa de Z que es mama de Y)
abuelo(X,Y) :- mama(X,Z), papa(Z,Y). %(X es el abuelo de Y si hay una mama de Z que es papa de Y)
abuelo(X,Y) :- mama(X,Z), mama(Z,Y). %(X es el abuelo de Y si hay una mama de Z que es mama de Y)
abuela(X,Y) :- abuelo(Z,Y), esposa(X,Z). %(X es la abuela de Y si es la esposa de un abuelo de Y)
mama(X,Y) :- mama(X,Y). %(X es la mamá de Y si es la mama de Y)
papa(X,Y) :- papa(X,Y). %(X es el papá de Y si es el papa de Y)
esposo(X,Y) :- esposo(Y,X). %(X es el esposo de Y si Y es el esposo de X)
esposa(X,Y) :- esposa(Y,X). %(X es la esposa de Y si Y es la esposa de X)
hermano(X,Y) :- papa(Z,X), papa(Z,Y), mama(W,X), mama(W,Y), X=Y. %(X es el hermano de Y si tienen el mismo papa y la misma mama y no son la misma persona)
hermana(X,Y) :- papa(Z,X), papa(Z,Y), mama(W,X), mama(W,Y), X=Y. %(X es la hermana de Y si tienen el mismo papa y la misma mama y no son la misma persona)
primo(X,Y) :- papa(Z,X), hermano(Z,W), papa(W,Y), X=Y. %(X es el primo de Y si tienen un papa en común y el papa de X es hermano del papa de Y)
primo(X,Y) :- papa(Z,X), hermana(Z,W), papa(W,Y), X=Y. %(X es el primo de Y si tienen un papa en común y el papa de X es hermana del papa de Y)
prima(X,Y) :- mama(Z,X), hermano(Z,W), mama(W,Y), X=Y. %(X es la prima de Y si tienen una mama en común y el papa de X es hermano de la mama de Y)
prima(X,Y) :- mama(Z,X), hermana(Z,W), mama(W,Y), X=Y. %(X es la prima de Y si tienen una mama en común y el papa de X es hermana de la mama de Y)
tio(X,Y) :- papa(Z,Y), hermano(X,Z). %(X es el tío de Y si es hermano del papa de Y)
tio(X,Y) :- mama(Z,Y), hermano(X,Z). %(X es el tío de Y si es hermano de la mama de Y)
tia(X,Y) :- papa(Z,Y), hermana(X,Z). %(X es la tía de Y si es hermana del papa de Y)
tia(X,Y) :- mama(Z,Y), hermana(X,Z). %(X es la tía de Y si es hermana de la mama de Y)