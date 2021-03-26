:- dynamic relacionar/1.
%Análisis de lenguaje estructural

preposiciones-->[en].
preposiciones-->[entre].
preposiciones-->[hacia].
preposiciones-->[hasta].
preposiciones-->[mediante].
preposiciones-->[para].
preposiciones-->[por].
preposiciones-->[segun].
preposiciones-->[sin].
preposiciones-->[so].
preposiciones-->[sobre].
preposiciones-->[tras].
preposiciones-->[versus].

articulo-->[el].
articulo-->[la].
articulo-->[las].
articulo-->[lo].
articulo-->[los].
articulo-->[un].
articulo-->[unos].
articulo-->[una].
articulo-->[unas].

verbo-->[ir];[voy];[vaya];[va];[vamos];[vayan];[vengo];[van];[venir].
verbo-->[pasar];[pase];[paso];[pasare];[pasaria];[pasase]. 
verbo-->[llegar];[llego];[llegue];[llegare];[llegan].
verbo-->[dirigir];[dirijo]; [dirigimos]; [dirigiste];[dirigire];[dirigiria].%
verbo-->[trasladar];[traslado]; [trasladamos]; [trasladare]; [trasladaremos].%
verbo-->[mover];[muevo];[movi];[movere];[moveremos].
verbo-->[acudir];[acudi];[acudire];[acudo];[acudiremos];[acudiran].
verbo-->[asistir];[asisto];[asistire];[asitiremos];[asistimos].
verbo-->[recorrer];[recorro];[recorrere];[recorreremos];[recorremos].
verbo-->[querer];[quiero];[queremos].


pronombres-->[yo].
pronombres-->[nosotros].
pronombres-->[el].
pronombres-->[ella].
pronombres-->[ellas].
pronombres-->[ellos].

local-->[tienda].
local-->[pulperia].
local-->[supermercado].
local-->[cine].
local-->[farmacia].
local-->[hospital].
local-->[clinica].
local-->[gimnasio].
local-->[parque].
local-->[municipalidad].
local-->[banco].
local-->[plaza].
local-->[mall].
local-->[centro].
local-->[comercial].
local-->[registro].
local-->[carniceria].
local-->[verduleria].
local-->[puerto].
local-->[piscina].
local-->[ferreteria].



oracion --> sintagma_nominal, sintagma_verbal.
oracion--> sintagma_verbal.
sintagma_nominal --> pronombres.
sintagma_nominal --> articulo, local.
%sintagma_nominal --> lugar.
%sintagma_nominal --> articulo, lugar.
sintagma_verbal --> verbo, sintagma_nominal.


make-list(L):-
    readln(Dato),
    atomic_list_concat(L, ' ', Dato).

%Grafo de lugares

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