inversa(X,Y):- inversa(X,Y,[]).
inversa([],X,X).
inversa([Cabeza|Resto],X,Res) :- 
    inversa(Resto,X,[Cabeza|Res]).

eliminarUltimo([_],[]).
eliminarUltimo([Head,_],[Head]).
eliminarUltimo([Head|Tail],[Head|Tail2]):-eliminarUltimo(Tail,Tail2).

miembro(Elemento,[_|Resto]):- miembro(Elemento,Resto).
miembro(Elem,[Elem|_]).