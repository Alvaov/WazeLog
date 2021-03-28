:-consult(grafo).
%Análisis de lenguaje estructural
preposiciones-->[].
preposiciones-->[a].
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

articulo-->[].
articulo-->[el].
articulo-->[la].
articulo-->[las].
articulo-->[lo].
articulo-->[los].
articulo-->[un].
articulo-->[unos].
articulo-->[una].
articulo-->[unas].


verbo-->[].
verbo-->[viaje];[viajo];[viajar];[viajamos];[viajaremos].
verbo-->[ir];[voy];[vaya];[va];[vamos];[vayan];[vengo];[van];[venir].
verbo-->[pasar];[pase];[paso];[pasare];[pasaria];[pasase]. 
verbo-->[llegar];[llego];[llegue];[llegare];[llegan].
verbo-->[dirigir];[dirijo]; [dirigimos]; [dirigiste];[dirigire];[dirigiria].
verbo-->[trasladar];[traslado]; [trasladamos]; [trasladare]; [trasladaremos].
verbo-->[mover];[muevo];[movi];[movere];[moveremos].
verbo-->[acudir];[acudi];[acudire];[acudo];[acudiremos];[acudiran].
verbo-->[asistir];[asisto];[asistire];[asitiremos];[asistimos].
verbo-->[recorrer];[recorro];[recorrere];[recorreremos];[recorremos].
verbo-->[querer];[quiero];[queremos].
verbo-->[estar];[estoy];[estamos];[estan].
verbo-->[encontrar];[encuentro];[encontramos].
verbo-->[necesito];[necesitar];[necesitamos].
infinitivo-->[];[ir].

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

adverbio-->[si];[no];[].

oracion --> sintagma_nominal, sintagma_verbal.
sintagma_nominal-->[].
sintagma_nominal --> pronombres.
sintagma_nominal --> preposiciones, articulo, local.
sintagma_nominal --> preposiciones, {lugar(X)},[X].
sintagma_verbal --> adverbio, verbo,infinitivo, sintagma_nominal.


lugar(X):-arco(X,_,_,_,_);arco(_,X,_,_,_).