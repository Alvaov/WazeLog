:-consult(sintaxis).
:-consult(funciones_de_lista).
%Funcion Inicial
/*
    Author: Brian Wagemans
    Description: Inits the program , make all the questions and prints the responses
    iniciar()
*/
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
    
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Prints a message of error
    nlp_error()
*/
nlp_error:-
    write(" Perdon, no te entendi. \n").
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Ask the user a ubication until it get a proper ubication
    ubicacion(-Origen)
        *Origen: The ubication found 
*/
ubicacion(Origen):-
    respuesta_usuario(Y),
    encontrar_ubicacion(Y,Origen),!.

/*
     Author: Luis Andrey Zuniga Hernandez
    Description: Ask the user a ubication until it get a proper ubication, it fails print an error, and tries again
    ubicacion(-Origen)
        *Origen: The ubication found 
*/
ubicacion(Origen):-
    nlp_error,
    ubicacion(Origen),!.
/*
    Author: Luis Andrey Zuniga Hernandez 
    Description: Given a answer from the user, get a destiny in the graph, if there is one
    encontrar_ubicacion(+Respuesta_Usuario,-Destino)
        *Respuesta_Usuario: an input of a user given a a list of atoms in lower case
        *Destino: a destiny if there is one on the list given as user input 
*/
encontrar_ubicacion(Respuesta_Usuario,Destino):-
    es_lugar(Respuesta_Usuario,Destino).
/*
    Author: Luis Andrey Zuniga Hernandez 
    Description: Given a answer from the user, if the input is a place in the city , asks where it is, and makes a recursive call
    encontrar_ubicacion(+Respuesta_Usuario,-Destino)
        *Respuesta_Usuario: an input of a user given a a list of atoms in lower case
        *Destino: a destiny if there is one on the list given as user input 
*/
encontrar_ubicacion(Respuesta_Usuario,Destino):-
    pedir_ubicacion_lugar(Respuesta_Usuario,Lugar),
    encontrar_ubicacion(Lugar,Destino).

/*
    Author: Alejandro Vasquez 
    Description: Takes a list and verifies if any member of the list is and starting point in any edge of the graph
    es_lugar(+Lista,?Destino)
        *Input: The user input as a list
        *Destino: a destiny in the list 
*/
es_lugar(Input,Destino):- miembro(Destino,Input), arco(Destino,_,_,_,_),!.
/*
    Author: Alejandro Vasquez 
    Description: Takes a list and verifies if any member of the list is and end point in any edge of the graph
    es_lugar(+Lista,?Destino)
        *Input: The user input as a list
        *Destino: a destiny in the list 
*/
es_lugar(Input,Destino):- miembro(Destino,Input), arco(_,Destino,_,_,_),!.
/*
    Author: Alejandro Vasquez 
    Description: Takes a list and verifies if is a local  in any edge of the graph
    es_lugar(+Lista,?Destino)
        *Input: The user input as a list
        *Destino: a destiny in the list 
*/
es_local(Input,Local):-
    miembro(Local,Input),
    local([Local],[]).

/*
    Author: Brian Wagemans 
    Description: Returns a list of the intermediate destinies given by the user, if asked a question
    destinos_intermedios(-Lista_Destinos)
        *Lista_Destinos: A list of intermediates destinies given by the user 
*/
destinos_intermedios(Lista_Destinos):-
    write("Excelente, tiene algun destino intermedio? \n"),
    respuesta_usuario(Res_usr),!,
    verificacion_intermedia(Res_usr,Lista_Destinos).
/*
    Author: Brian Wagemans 
    Description: if the sentence doesnt sucess, calls a error and calls itself 
    destinos_intermedios(-Lista_Destinos)
        *Lista_Destinos: A list of intermediates destinies given by the user 
*/
destinos_intermedios(Lista_Destinos):-
    nlp_error,
    destinos_intermedios(Lista_Destinos).
/*
    Author: Brian Wagemans 
    Description: Given respose from the user gets a place in the graph if theres if one,if asked a question
    existe_destino_intermedio(+Oracion,-Lugar)
        *Oracion: User input given as list
        *Lugar: The place the in user input
*/
existe_destino_intermedio(Oracion,Lugar):-
    es_lugar(Oracion,Lugar),!.
/*
    Author: Brian Wagemans 
    Description: Given respose from the user verifies if it is a location in the city, and asks where is is ,if asked a question
    existe_destino_intermedio(+Oracion,-Lugar)
        *Oracion: User input given as list
        *Lugar: The place the in user input
*/
existe_destino_intermedio(Oracion,Lugar):-
    pedir_ubicacion_lugar(Oracion,Destino),
    existe_destino_intermedio(Destino,Lugar),!.
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Takes an user input, and verifies if there a location to return where that locatio is by asking the user 
    pedir_ubicacion_lugar(+Oracion,-Destino)
        *Oracion: The input of the user given as a list 
        *Destino: a place on a graph

*/
pedir_ubicacion_lugar(Oracion,Destino):-
    es_local(Oracion,Local),
    atom_string(Local,Local_string),
    string_concat("Cual ", Local_string, X),
    write(X),write("? \n"),
    esperar_respuesta_valida(Destino).

/*  
    Author: Luis Andrey Zuniga Hernandez
    Description: Keeps asking the user until gets a valid answer 
    esperar_respuesta_valida(-Respuesta)
        *Respuesta: A valid response from the user 
    
*/
esperar_respuesta_valida(Respuesta):-
    respuesta_usuario(Respuesta),!.
/*  
    Author: Luis Andrey Zuniga Hernandez
    Description: if the answer is not valid, print a error and call itself
    esperar_respuesta_valida(-Respuesta)
        *Respuesta: A valid response from the user 
    
*/
esperar_respuesta_valida(Respuesta):-
    nlp_error,
    esperar_respuesta_valida(Respuesta).
/*
    Author: Alejandro Vasquez 
    Description: verifies if theres is a negation in the sentence.
    verificacion_intermedia(+Oracion,[])
        *Oracion: the user input given as a list 
*/

verificacion_intermedia(Oracion,[]):-
    miembro(no,Oracion).
/*
    Author: Alejandro Vasquez 
    Description: verifies if the input has a place, adds it to the list, a calls destinos_intermedios
    verificacion_intermedia(+Oracion,-Destinos_Intermedios)
        *Oracion: the user input given as a list 
        *Destinos_Intermedios: a list of nodes in the graph
*/
verificacion_intermedia(Oracion,Destinos_intermedios):-
    existe_destino_intermedio(Oracion, Nodo),
    destinos_intermedios(Lista1),
    append([Nodo],Lista1,Destinos_intermedios),!.
/*
    Author: Alejandro Vazquez 
    Description: finish condition to the verificacion intermedia 
*/
verificacion_intermedia(Lugar,Lugar).
/*  
    Author: Brian Wagemans
    Description: gets a reponse from the user, using read line and verifing that is a sentence defined in the syntax given 
    respuesta_usuario(-Respuesta)
        *Respuesta: The response from the user 
*/
respuesta_usuario(Respuesta):-
    readln(X,_,_,_,lowercase),
    eliminarUltimo(X,Y),
    nombres_complejos(Y,Respuesta),
    oracion(Respuesta,[]),!.
/*
    Author: Luis Andrey Zuniga Hernandez
Description: End condition to the give route, if there is just one input, it means that the user is already in the final destiny
*/
give_route([Nodo],_):- 
    write_ln("Estimado usuario usted ya se encuentra en su destino."),!,fail.

give_route([Nodo_inicial,Nodo_Final],Respuesta):-
    dijkstra(Nodo_inicial,Nodo_Final,Respuesta).
/*
    Author: Luis Andrey Zuniga H
    Description: Gets the dijkstra from a init point to a finish point 
    give_route([+Nodo_Inicial,+Nodo_Final],-Respuesta)
        *Nodo_Inicial: The start node
        *Nodo_Final: The final node
        *Respuesta: The route to follow
*/
give_route([Nodo_inicial,Nodo_sig|Resto],Respuesta):- 
    dijkstra(Nodo_inicial,Nodo_sig,Res_parcial), 
    longitud(Res_parcial,Lenght),
    Lenght > 0,
    give_route([Nodo_sig|Resto],[Nodo_sig|Respuesta_resto]),
    append(Res_parcial,Respuesta_resto, Respuesta).
/*
    Author: Luis Andrey Zuniga
    Description: When reached the route will be empty
*/

give_route(_,[]).
 /*
    Author: Luis Andrey Zuniga 
    Description: End condition of the ruta_es rule
 */
ruta_es([]):-
    write("Lo siento, no hay ruta \n"),fail,!.
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: if used to print the route given
    ruta_es(+Ruta)
        *Ruta: A route given as a list
*/
ruta_es(Ruta):-
    miembro(X,Ruta),
    write(X),write(", "),fail.
/*
    Author:Luis Andrey Zuniga Hernandez
    Description: End condition
*/
ruta_es(_):-!.


/*
    Author: Brian Wagemans 
    Description: End conditions to the duration's rule 
*/
duracion([_],0).
duracion([],0).
/*
    Author: Brian Wagemans 
    Description: takes a list of destinies, and if it is rush hour, if uses the the traffic jam time, and gets the duration
    duration([+Destino_Actual,+Sig_Destino|+Resto_Destino],-Duration)
        *Destino_Actual: First destiny in the list
        *Destino_siguiente: Second destiny in the list
        *Resto_Destinos: The leftover of the list
        *Duration: The time of the given route
*/
duracion([Destino_actual,Sig_destino|Resto_destinos],Duracion):-
    hora_pico(),
    append([Sig_destino],Resto_destinos,Destinos),
    duracion(Destinos,Nueva_duracion),
    arco(Destino_actual,Sig_destino,_,_,X),
    Duracion is Nueva_duracion + X,!.
/*
    Author: Brian Wagemans 
    Description: takes a list of destinies, and if it is rush hour, if uses the the not  traffic jam time, and gets the duration
    duration([+Destino_Actual,+Sig_Destino|+Resto_Destino],-Duration)
        *Destino_Actual: First destiny in the list
        *Destino_siguiente: Second destiny in the list
        *Resto_Destinos: The leftover of the list
        *Duration: The time of the given route
*/
duracion([Destino_actual,Sig_destino|Resto_destinos],Duracion):-
    append([Sig_destino],Resto_destinos,Destinos),
    duracion(Destinos,Nueva_duracion),
    arco(Destino_actual,Sig_destino,_,X,_),
    Duracion is Nueva_duracion + X.

/*
    Author: Alejandro Wagemans 
    Description: verifies if the current time is within the rush hour 
    hora_pico()
*/
hora_pico():-
    hour_of_day(Hora),
    rango(Hora).
/*
    Author: Alejandro Vasquez
    Description: given a x, verifies if  4<X<9
    rango(+X)
        *X: a number 
*/
rango(X):-
    4 < X, X < 9,!.
/*
    Author: Alejandro Vasquez
    Description: given a x, verifies if  11<X<14
    rango(+X)
        *X: a number 
*/
rango(X):-
    11 < X, X < 14,!.
/*
    Author: Alejandro Vasquez
    Description: given a x, verifies if  16<X<21
    rango(+X)
        *X: a number 
*/
rango(X):-
    16 < X, X < 21.
/*
	Author: Luis Andrey Zuniga 
	Description: Its used to get the hour of the system in 24 hours format 
	hour_of_day(-Hour)
		*Hour: The hour in the system in 24 hour format 

*/
hour_of_day(Hour):- get_time(Time),
    stamp_date_time(Time,FormattedDate,local),
    date_time_value(hour,FormattedDate,Hour).
/*
    Author: Luis Andrey Zuniga 
    Description: takes a list a verifies if the first two element joined is a name of a place in the graph 
    nombres_complejos([+PrimeraPalabra,+SegundaPalabra|+Resto],-Formato_Analisis)
        *PrimeraPalabra: Primera palabra del input
        *SegundaPalabra: Segunda palabra del input
        *Resto: Resto del input
        *Formato_Analisis: La lista con los pares unidos 
*/
nombres_complejos([PrimerPalabra,SegundaPalabra|Resto],Formato_Analisis):-
    atom_concat(PrimerPalabra,SegundaPalabra,Fusion),
    lugar(Fusion),
    nombres_complejos(Resto,Nuevo_Formato),
    append([Fusion],Nuevo_Formato,Formato_Analisis),!.
/*
    Author: Luis Andrey Zuniga 
    Description: takes a list a verifies if the first two element joined is not a name of a place in the graph, the calls itself 
    nombres_complejos([+PrimeraPalabra,+SegundaPalabra|+Resto],-Formato_Analisis)
        *PrimeraPalabra: Primera palabra del input
        *SegundaPalabra: Segunda palabra del input
        *Resto: Resto del input
        *Formato_Analisis: La lista con los pares unidos 
*/
nombres_complejos([PrimeraPalabra|Resto],Formato_Analisis):-
    nombres_complejos(Resto,Nuevo_Formato),
    append([PrimeraPalabra],Nuevo_Formato,Formato_Analisis),!.

/*
    Author: Luis Andrey Zuniga Hernandez
    Description: end condition of nombres_complejos 
*/
nombres_complejos([Palabra],[Palabra]).
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: end condition of nombres_complejos 
*/
nombres_complejos([],[]).

/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Takes a list of places, and verifies if the firt two elementos are the same, the delete all the consecutive apperances of the place, calls itself 
    eliminar_destinos_seguidos([+Elemento,+Elemento|+Resto],-Cociente)
        *Elemento: The first place in the list 
        *Resto: The leftover of the list
*/
eliminar_destinos_seguidos([Elemento,Elemento|Resto],Cociente):-
    eliminar_todos_los_consecutivos(Elemento,Resto,Resto_Corregidos),
    eliminar_destinos_seguidos(Resto_Corregidos,Cociente_Siguiente),
    append([Elemento],Cociente_Siguiente,Cociente),!.
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Takes a list of places, and verifies if the firt two elementos are not the same, and call itself with out the first element
    eliminar_destinos_seguidos([+Elemento,+Elemento|+Resto],-Cociente)
        *Elemento: The first place in the list 
        *Resto: The leftover of the list
*/
eliminar_destinos_seguidos([Elemento|Resto],Cociente):-
    eliminar_destinos_seguidos(Resto,Cociente_Siguiente),
    append([Elemento],Cociente_Siguiente,Cociente),!.
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: end condition of eliminar_destinos_seguidos
*/
eliminar_destinos_seguidos([Elemento],[Elemento]):-!.
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: end condition of eliminar_destinos_seguidos
*/
eliminar_destinos_seguidos([],[]).
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Delete all the consecutives apperances of element
    eliminar_todos_los_consecutivos(+Elemento,[+Elemento|+Resto],-Lista_Resultado)
        *Elemento: The Element to delete
        *Resto: Left over of the list
        *Lista_Resultado: the list without the apperances of Element at the start 
*/
eliminar_todos_los_consecutivos(Elemento,[Elemento|Resto],Lista_Resultado):-
    eliminar_todos_los_consecutivos(Elemento,Resto,Lista_Resultado),!.

/*
    Author: Luis Andrey Zuniga Hernandez
    Description: end condition of eliminar_todos_los_consecutivos
*/
eliminar_todos_los_consecutivos(Elemento,Lista,Lista).