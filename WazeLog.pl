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
articulo-->[ellos].
articulo-->[la].
articulo-->[las].
articulo-->[lo].
articulo-->[los].
articulo-->[un].
articulo-->[unos].
articulo-->[una].
articulo-->[unas].


verbo-->[ir].
verbo-->[venir].
verbo-->[pasar].
verbo-->[llegar].
verbo-->[dirigir].
verbo-->[trasladar].
verbo-->[mover].
verbo-->[acudir].
verbo-->[asistir].
verbo-->[recorrer].
verbo-->[caer].
verbo-->[presentar].
verbo-->[arrivar].
verbo-->[quedar].


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
sintagma_nominal --> local.
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
    write(X).

