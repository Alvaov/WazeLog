:-dynamic rpath/2.      % A reversed dist 
:-consult(grafo).
hour_of_day(Hour):- get_time(Time),
                    stamp_date_time(Time,FormattedDate,local),
                    date_time_value(hour,FormattedDate,Hour).

grafo(Inicial,Final,Dist):-arco(Inicial,Final,Dist,_,_).

%dist(From,To,Dist) :- grafo(To,From,Dist).
dist(From,To,Dist) :- grafo(From,To,Dist).
 
shorterPath([H|Path], Dist) :-		       % dist < stored dist? replace it
	rpath([H|T], D), !, Dist < D,          % match target node [H|_]
	retract(rpath([H|_],_)),
	assert(rpath([H|Path], Dist)).
shorterPath(Path, Dist) :-		       % Otherwise store a new dist
	assert(rpath(Path,Dist)).
 
traverse(From, Path, Dist) :-		    % traverse all reachable nodes
	dist(From, T, D),		    % For each neighbor
	not(memberchk(T, Path)),	    %	which is unvisited
	shorterPath([T,From|Path], Dist+D), %	Update shortest dist and distance
	traverse(T,[From|Path],Dist+D).	    %	Then traverse the neighbor
 
traverse(From) :-
	retractall(rpath(_,_)),           % Remove solutions
	traverse(From,[],0).              % Traverse from origin
traverse(_).
 
dijkstra(From, To, Route) :-
	traverse(From),                   % Find all distances
	rpath([To|RPath], Dist)->         % If the target was reached
	  reverse([To|RPath], Route),!.      % Report the dist and distance
      
dijkstra(_,_,[]).
 
