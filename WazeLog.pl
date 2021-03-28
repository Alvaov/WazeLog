:-consult(sintaxis).
:-consult(funciones_de_lista).
%Funcion Inicial
iniciar():-
    write("Bienvenido a WazeLog la mejor logica de llegar a su destino. \n"),
    ubicacion_inicial(Punto_incial),
    destinos_intermedios(Destinos_intermedios),
    write(Destinos_intermedios).
    

nlp_error:-
    write(" Perdon, no te entendi. \n").

ubicacion_inicial(Origen):-
    write("Por Favor indique el lugar en el que se encuentra. \n"),
    respuesta_usuario(Y),
    lugar(Y, Origen),!.

ubicacion_inicial(Origen):-
    nlp_error,
    ubicacion_inicial(Origen),!.

lugar(Lista,X):- miembro(X,Lista), arco(X,_,_,_,_),!.

es_local(Lista,X):-
    miembro(X,Lista),
    local([X],[]).


destinos_intermedios(Lista):-
    write("Excelente, tiene algun destino intermedio? \n"),
    respuesta_usuario(Res_usr),!,
    hecho(Res_usr,Lista).

existe_destino_intermedio(Oracion,Lugar):-
    lugar(Oracion,Lugar),!.

existe_destino_intermedio(Oracion,Lugar):-
    es_local(Oracion,Local),
    atom_string(Local,Local_string),
    string_concat("¿Cual ", Local_string, X),
    write(X),write("? \n"),
    respuesta_usuario(Y),
    existe_destino_intermedio(Y,Lugar),!.

hecho(X,Lista):-
    miembro(no,X),Lista = [],!.

hecho(X,Lista):-
    existe_destino_intermedio(X, Nodo),
    destinos_intermedios(Lista1),
    append([Nodo],Lista1,Lista),!.

hecho(X,X).

respuesta_usuario(Y):-
    readln(X),
    eliminarUltimo(X,Y),
    oracion(Y,[]).
