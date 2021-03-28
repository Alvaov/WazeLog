inversa(X,Y):- inversa(X,Y,[]).
inversa([],X,X).
inversa([Cabeza|Resto],X,Res) :- 
    inversa(Resto,X,[Cabeza|Res]).

eliminarUltimo([_],[]).
eliminarUltimo([Head,_],[Head]).
eliminarUltimo([Head|Tail],[Head|Tail2]):-eliminarUltimo(Tail,Tail2).

miembro(Elemento,[_|Resto]):- miembro(Elemento,Resto).
miembro(Elem,[Elem|_]).

longitud([],0).
longitud([_|Cola],Cnt):-
    longitud(Cola,Cnt1), Cnt is Cnt1 +1.