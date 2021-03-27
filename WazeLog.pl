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


destinos_intermedios(Lista):-
    write("Excelente, tiene algun destino intermedio? \n"),
    respuesta_usuario(Res_usr),!,
    existe_destino_intermedio(Res_usr, Nodo),
    Lista is [Nodo|Lista],
    destinos_intermedios(Lista1).

destinos_intermedios(Lista):-
    nlp_error,
    destinos_intermedios(Lista).

respuesta_usuario(Y):-
    readln(X),
    eliminarUltimo(X,Y),
    oracion(Y,[]).

existe_destino_intermedio(Lista,Lugar):- lugar(Lista,Lugar).