:-consult(sintaxis).
:-consult(funciones_de_lista).
%Funcion Inicial
iniciar():-
    write("Bienvenido a WazeLog la mejor logica de llegar a su destino. \n"),
    write("Por Favor indique el lugar en el que se encuentra. \n"),
    ubicacion(Punto_incial),
    destinos_intermedios(Destinos_intermedios),
    write("Por favor indique hacia donde nos dirigimos \n"), 
    ubicacion(Punto_final),
    append([Punto_incial], Destinos_intermedios, Ruta_inicial),
    append(Ruta_inicial, [Punto_final], Destinos),
    give_route(Destinos,Ruta_completa),
    write("Su ruta es: "),
    inversa(Ruta_completa,Ruta_invertida),
    ruta_es(Ruta_invertida),
    write("tiempo estimado de viaje: "),
    duracion(Ruta_completa,Tiempo_recorrido),
    write(Tiempo_recorrido), write(" horas. \n"),
    write("Muchas gracias por utilizar WazeLog. \n").
    

nlp_error:-
    write(" Perdon, no te entendi. \n").

ubicacion(Origen):-
    respuesta_usuario(Y),
    lugar(Y, Origen),!.

ubicacion(Origen):-
    nlp_error,
    ubicacion(Origen),!.

lugar(Lista,X):- miembro(X,Lista), arco(X,_,_,_,_),!.
lugar(Lista,X):- miembro(X,Lista), arco(_,X,_,_,_),!.

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
    oracion(Y,[]),!.

give_route([Nodo,Nodo],Respuesta):- 
    write_ln("Ya llegaste a tu destino.").

give_route([Nodo_inicial,Nodo_Final],Respuesta):-
    dijkstra(Nodo_inicial,Nodo_Final,Respuesta).

give_route([Nodo_inicial,Nodo_sig|Resto],Respuesta):- 
    dijkstra(Nodo_inicial,Nodo_sig,Res_parcial), 
    longitud(Res_parcial,Lenght),
    Lenght > 0,
    give_route([Nodo_sig|Resto],[Nodo_sig|Respuesta_resto]),
    append(Res_parcial,Respuesta_resto, Respuesta).

give_route(_,[]).

ruta_es([]):-
    write("Lo siento, no hay ruta"),!.

ruta_es(Ruta):-
    miembro(X,Ruta),
    write(X),write(", "),fail.

ruta_es(_):-!.

duracion([_],0).

duracion([Destino_actual,Sig_destino|Resto_destinos],Duracion):-
    hora_pico(),
    append([Sig_destino],Resto_destinos,Destinos),
    duracion(Destinos,Nueva_duracion),
    arco(Destino_actual,Sig_destino,_,_,X),
    Duracion is Nueva_duracion + X,!.

duracion([Destino_actual,Sig_destino|Resto_destinos],Duracion):-
    append([Sig_destino],Resto_destinos,Destinos),
    duracion(Destinos,Nueva_duracion),
    arco(Destino_actual,Sig_destino,_,X,_),
    Duracion is Nueva_duracion + X.


hora_pico():-
    hour_of_day(Hora),
    rango(Hora).

rango(X):-
    4 < X, X < 9,!.

rango(X):-
    11 < X, X < 14,!.

rango(X):-
    16 < X, X < 21.

hour_of_day(Hour):- get_time(Time),
    stamp_date_time(Time,FormattedDate,local),
    date_time_value(hour,FormattedDate,Hour).