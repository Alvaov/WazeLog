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

arco(alajuela, heredia, 60, 1,2).
arco(heredia,alajuela,60,1,2).
arco(sanjose, heredia, 50, 2,3).
arco(puntarenas, heredia, 80, 4,5).
arco(guanacaste, heredia, 70, 2,3).
arco(guanacaste, alajuela, 110, 4,7).
arco(alajuela, guanacaste, 105, 4,8).
arco(alajuela, puntarenas, 60, 3,4).
arco(alajuela, limon, 80, 3,6).
arco(limon, heredia, 85, 4,6).
arco(limon, alajuela, 80, 3,6).
arco(alajuela, sanjose, 30, 1,3).
arco(sanjose,alajuela,30,3,2).

