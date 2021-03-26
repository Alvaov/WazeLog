
:-consult(sintaxis).
%Funcion Inicial
iniciar():-
    
    write("Bienvenido a WazeLog la mejor logica de llegar a su destino. \n"),
    write("Por Favor indique el lugar en el que se encuentra."),
    readln(X),
    eliminarUltimo(X,Y), 
    write(X),
    phrase(oracion,Y).

eliminarUltimo([Head],[]).
eliminarUltimo([Head,Tail],[Head]).
eliminarUltimo([Head|Tail],[Head|Tail2]):-eliminarUltimo(Tail,Tail2).