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

destino_intermedio(Lista):-preguntar_intermedio(Lugar),destino_intermedio(Lista,Lugar),!.
destino_intermedio([]).
destino_intermedio(Lista,Lugar):-destino_intermedio(Lista1),append([Lugar],Lista1,Lista),!.
destino_intermedio(L,Lugar):-append([],[Lugar],L).
respuesta_usuario(Y):-
    readln(X),
    eliminarUltimo(X,Y),
    oracion(Y,[]),!.
preguntar_intermedio(Lugar):-write("Tiene algun destino intermedio: \n"),respuesta_usuario(Respuesta),lugar(Respuesta,Lugar).
