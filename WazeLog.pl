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
    eliminar_destinos_seguidos(Destinos,Destinos_Corregidos),
    give_route(Destinos_Corregidos,Ruta_completa),
    write("Su ruta es: "),
    inversa(Ruta_completa,Ruta_invertida),
    write("\n"),
    ruta_es(Ruta_invertida),
    write("tiempo estimado de viaje: "),
    duracion(Ruta_completa,Tiempo_recorrido),
    write("\n"),
    write(Tiempo_recorrido), write(" horas. \n"),
    write("Muchas gracias por utilizar WazeLog. \n"),!.
    

nlp_error:-
    write(" Perdon, no te entendi. \n").

ubicacion(Origen):-
    respuesta_usuario(Y),
    encontrar_ubicacion(Y,Origen),!.

ubicacion(Origen):-
    nlp_error,
    ubicacion(Origen),!.
encontrar_ubicacion(Respuesta_Usuario,Destino):-
    es_lugar(Respuesta_Usuario,Destino).
encontrar_ubicacion(Respuesta_Usuario,Destino):-
    pedir_ubicacion_lugar(Respuesta_Usuario,Lugar),
    encontrar_ubicacion(Lugar,Destino).
es_lugar(Lista,X):- miembro(X,Lista), arco(X,_,_,_,_),!.
es_lugar(Lista,X):- miembro(X,Lista), arco(_,X,_,_,_),!.

es_local(Lista,X):-
    miembro(X,Lista),
    local([X],[]).


destinos_intermedios(Lista):-
    write("Excelente, tiene algun destino intermedio? \n"),
    respuesta_usuario(Res_usr),!,
    verificacion_intermedia(Res_usr,Lista).

existe_destino_intermedio(Oracion,Lugar):-
    es_lugar(Oracion,Lugar),!.

existe_destino_intermedio(Oracion,Lugar):-
    pedir_ubicacion_lugar(Oracion,Destino),
    existe_destino_intermedio(Destino,Lugar),!.

pedir_ubicacion_lugar(Oracion,Destino):-
    es_local(Oracion,Local),
    atom_string(Local,Local_string),
    string_concat("Cual ", Local_string, X),
    write(X),write("? \n"),
    respuesta_usuario(Destino).

verificacion_intermedia(X,Lista):-
    miembro(no,X),Lista = [],!.

verificacion_intermedia(X,Lista):-
    existe_destino_intermedio(X, Nodo),
    destinos_intermedios(Lista1),
    append([Nodo],Lista1,Lista),!.

verificacion_intermedia(X,X).
respuesta_usuario(Z):-
    readln(X,_,_,_,lowercase),
    eliminarUltimo(X,Y),
    nombres_complejos(Y,Z),
    oracion(Z,[]),!.

give_route([Nodo],_):- 
    write_ln("Estimado usuario usted ya se encuentra en su destino."),!,fail.

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
    write("Lo siento, no hay ruta \n"),fail,!.

ruta_es(Ruta):-
    miembro(X,Ruta),
    write(X),write(", "),fail.

ruta_es(_):-!.

duracion([_],0).
duracion([],0).

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
nombres_complejos([PrimerPalabra,SegundaPalabra|Resto],Formato_Analisis):-
    atom_concat(PrimerPalabra,SegundaPalabra,Fusion),
    lugar(Fusion),
    nombres_complejos(Resto,Nuevo_Formato),
    append([Fusion],Nuevo_Formato,Formato_Analisis),!.
nombres_complejos([PrimeraPalabra|Resto],Formato_Analisis):-
    nombres_complejos(Resto,Nuevo_Formato),
    append([PrimeraPalabra],Nuevo_Formato,Formato_Analisis),!.
nombres_complejos([Palabra],[Palabra]).
nombres_complejos([],[]).


eliminar_destinos_seguidos([Elemento,Elemento|Resto],Cociente):-
    eliminar_todos_los_consecutivos(Elemento,Resto,Resto_Corregidos),
    eliminar_destinos_seguidos(Resto_Corregidos,Cociente_Siguiente),
    append([Elemento],Cociente_Siguiente,Cociente),!.
eliminar_destinos_seguidos([Elemento|Resto],Cociente):-
    eliminar_destinos_seguidos(Resto,Cociente_Siguiente),
    append([Elemento],Cociente_Siguiente,Cociente),!.
eliminar_destinos_seguidos([Elemento],[Elemento]):-!.
eliminar_destinos_seguidos([],[]).

eliminar_todos_los_consecutivos(Elemento,[Elemento|Resto],Lista_Resultado):-
    eliminar_todos_los_consecutivos(Elemento,Resto,Lista_Resultado),!.
eliminar_todos_los_consecutivos(Elemento,Lista,Lista).