
:-consult(sintaxis).
%Funcion Inicial
iniciar():-
    write("Bienvenido a WazeLog la mejor logica de llegar a su destino. \n"),
    ubicacion_inicial(Punto_incial),!.
    destino_intermedio(Destinos_intermedios),!.
    

nlp_error:-
    write(" Perdon Usuario-chan, no te entendi-nya. \n").

ubicacion_inicial(Origen):-
    write("Por Favor indique el lugar en el que se encuentra. \n"),
    respuesta_usuario(Y),!,
    origen(Y, Origen).

ubicacion_inicial(Origen):-
    nlp_error,
    ubicacion_inicial(Origen),
    !.

origen([Inicio|_],Inicio):- arco(Inicio,_,_,_,_).
origen([_|Tail],Inicio):- origen(Tail,Inicio).

destinos_intermedios(Lista):-
    write("Por Favor indique el lugar en el que se encuentra. \n"),
    respuesta_usuario(Y),!,
    origen(Y, Origen).

destinos_intermedios(Lista):-
    nlp_error,
    ubicacion_inicial(Lista),
    !.

eliminarUltimo([_],[]).
eliminarUltimo([Head,_],[Head]).
eliminarUltimo([Head|Tail],[Head|Tail2]):-eliminarUltimo(Tail,Tail2).

respuesta_usuario(Y):-
    readln(X),
    eliminarUltimo(X,Y),
    oracion(Y,[]).