:-dynamic rpath/2.      % A reversed dist 
:-consult(grafo).

/*
	Author: Brian Wagemans 
	Descripcion: verifies in the distance between two nodes is the given , or get the distance if asked  as a question
	grafo(?Inicial,?Final,?Dist)
		*Inicial: Punto del que parte
		*Final: Punto al que llegar
		*Dist: Distancia entre los puntos en una ruta directa si es que existe
*/
grafo(Inicial,Final,Dist):-arco(Inicial,Final,Dist,_,_).

/*
	Based:Rosetta code
	Modified: Brian Wagemans
	Description:This rule its used as interface for the one used in the dijkstra 
	dist(?From,?To,?Dist)
		*From: Punto del que parte
		*To: Punto al que llegar
		*Dist: Distancia entre los puntos en una ruta directa si es que existe
*/
dist(From,To,Dist) :- grafo(From,To,Dist).
 /*
	Based: Rosetta's code
	Get the shorterPath starting at the H node, and going to the next point in the path
	shorterPath([+H,+Path],?Dist)
		*H :the point where you are
		*Path: The path to tranverse
		*Dist: The distance of the path 
 */
shorterPath([H|Path], Dist) :-		       % dist < stored dist? replace it
	rpath([H|T], D), !, Dist < D,          % match target node [H|_]
	retract(rpath([H|_],_)),
	assert(rpath([H|Path], Dist)).
/*
	Based:rossetta's code
	Modified: Brian Wagemans 
	Description:Otherwise store a new dist
	shorterPath(+Path,?Dist)
		*Path: The path to tranverse
		*Dist: The distance of the path 
*/
shorterPath(Path, Dist) :-		       
	assert(rpath(Path,Dist)).

/*
	Based: Rosseta's code 
	Modified: Brian Wagemans 
	Description: traverse all reachable nodes
	transverse(+From,+Path,?Dist)
		*From: The start node
		*Path: The path to follow
		*Dist: The distance of the given path
*/

traverse(From, Path, Dist) :-		   
	dist(From, T, D),		    % For each neighbor
	not(memberchk(T, Path)),	    %	which is unvisited
	shorterPath([T,From|Path], Dist+D), %	Update shortest dist and distance
	traverse(T,[From|Path],Dist+D).	    %	Then traverse the neighbor
/*
	Based: Rosseta's code 
	Modified: Brian Wagemans 
	Description: traverse all reachable nodes
	transverse(+From)
		*From: The start node
*/
traverse(From) :-
	retractall(rpath(_,_)),           % Remove solutions
	traverse(From,[],0).              % Traverse from origin
traverse(_).
/*
	Base: Rosseta's code
	Modified: Brian Wagemans
	Description: Get the shortest route from a init to a finish node
	dijstra(+From,+To,-Route)
		*From: the start point
		*To: The end point
		*Route: the route to follow 
*/
dijkstra(From, To, Route) :-
	traverse(From),                   % Find all distances
	rpath([To|RPath], Dist)->         % If the target was reached
	  reverse([To|RPath], Route),!.      % Report the dist and distance
%End condition 
dijkstra(_,_,[]).
 
