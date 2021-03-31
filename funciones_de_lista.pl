/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Takes two list of the user a verifies in the are the inverse of each other 
    inversa(?X,?Y)
        *X: one of the list
        *Y: the inverse of the first list
    This used a auxiliar rule with the parameters

*/
inversa(X,Y):- inversa(X,Y,[]).

/*
    Author: Luis Andrey Zuniga Hernandez
    Description: The end condition to the inversa's rule 
*/
inversa([],X,X).

/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Given a list of input and a list initially void, contructs the inverse of the input list 
    inversa([+Cabeza,+Resto],?X,-Rest)
        *Cabeza: The first element of the list given
        *Resto: except for the first one, all the elements of the list given 
        *X: A list where we will build the list given in the a reverse order 
        *Rest : The result list, where it is the reverse of the list given
*/
inversa([Cabeza|Resto],X,Res) :- 
    inversa(Resto,X,[Cabeza|Res]).
/*  
    Author: Luis Andrey Zuniga Hernandez
    Description: Stop point to the delete last rule, this says if the list has only one element, the result should be a empty list 
*/
eliminarUltimo([_],[]).
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Another stop point to the delete last rule, in case you have a list of two element, return a list with the first element
*/
eliminarUltimo([Head,_],[Head]).
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Takes a two list a verifies if the second list is the first list without the last element
    eliminarUltimo([+Head,+Tai],[?Head,?Tail])
        *Head: The first element of both lists 
        *Tail: The tail of the first list
        *Tail2: The tail of the second list 
*/
eliminarUltimo([Head|Tail],[Head|Tail2]):-eliminarUltimo(Tail,Tail2).
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Verifies if a element is a member of a list, in this case, if the element is not the fist element uses the recursion with the rest of the list
    miembro(?Elemento,[_,+Resto])
        *Elemento: The element to look up in the list
        *Resto: Except for the first element, all the elements in the list
*/
miembro(Elemento,[_|Resto]):- miembro(Elemento,Resto).
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: end point to the miembro rule, if the first element of the list if the element, its true
*/
miembro(Elem,[Elem|_]).
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: end point to the longitud rule, if the list given is [] the length of the list is zero
*/
longitud([],0).
/*
    Author: Luis Andrey Zuniga Hernandez
    Description: Takes a List a lenght and verifies if the that is the length of the given list 
    longitud([_|+Cola],?Cnt])
        *Cola: All the elements in the list but the first element
        *Cnt the length of the list
*/
longitud([_|Cola],Cnt):-
    longitud(Cola,Cnt1), Cnt is Cnt1 +1.