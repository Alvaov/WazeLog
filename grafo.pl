/*
    Author: Brian Wagemans
    Description: A fact that describes an edge on a directed graph
    arco(From,To,Distance,time_without_traffic_jam,time with traffic jam)
        *From: Start point
        *To: End point 
        *Distance: The distance between the two nodes 
        *time_without_traffic_jam: The time to go from "From " to "To" in a trafic jam hour
        *time_with_traffic_jam:The time to go from "From " to "To" in a  not trafic jam hour
*/

arco(pacayas,cartago,13,1,1).
arco(pacayas,tresrios,15,1,1).
arco(pacayas,cervantes,8,1,1).

arco(cartago,pacayas,13,1,1).
arco(cartago,paraiso,10,1,1).
arco(cartago,tresrios,8,1,1).
arco(cartago,sanjose,20,1,1).
arco(cartago,musgoverde,10,1,1).

arco(tresrios,pacayas,15,1,1).
arco(tresrios,sanjose,8,1,1).

arco(turrialba,pacayas,18,1,1).
arco(turrialba,cachi,40,1,1).

arco(cachi,paraiso,10,1,1).
arco(cachi,turrialba,40,1,1).
arco(cachi,cervantes,7,1,1).
arco(cachi,orosi,12,1,1).


arco(paraiso,cervantes,4,1,1).
arco(paraiso,cachi,10,1,1).
arco(paraiso,orochi,8,1,1).

arco(cervantes,juanvinas,5,1,1).
arco(cervantes,pacayas,8,1,1).
arco(cervantes,cachi,7,1,1).

arco(orosi,cachi,12,1,1).
arco(orosi,paraiso,8,1,1).

arco(sanjose,cartago,20,1,1).
arco(sanjose,corralito,22,1,1).

arco(juanvinas,turrialba,4,1,1).


arco(musgoverde,cartago,10,1,1).
arco(musgoverde,corralito,6,1,1).

arco(corralito,musgoverde,6,1,1).
arco(corralito,sanjose,22,1,1).