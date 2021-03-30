:-consult(dijkstra).
%Análisis de lenguaje estructural
preposiciones-->[].
preposiciones-->[a].
preposiciones-->[ante].
preposiciones-->[de].
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
preposiciones-->[al].
preposiciones-->[del].

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
articulo-->[al].
articulo-->[del].

verbo-->[].
verbo-->[viaje];[viajo];[viajamos];[viajaremos].
verbo-->[voy];[vaya];[va];[vamos];[vayan];[vengo];[van].
verbo-->[pase];[paso];[pasare];[pasaria];[pasase]. 
verbo-->[llego];[llegue];[llegare];[llegan].
verbo-->[dirijo]; [dirigimos]; [dirigiste];[dirigire];[dirigiria].
verbo-->[traslado]; [trasladamos]; [trasladare]; [trasladaremos].
verbo-->[muevo];[movi];[movere];[moveremos].
verbo-->[acudi];[acudire];[acudo];[acudiremos];[acudiran].
verbo-->[asisto];[asistire];[asitiremos];[asistimos].
verbo-->[recorro];[recorrere];[recorreremos];[recorremos].
verbo-->[quiero];[queremos].
verbo-->[estoy];[estamos];[estan],[estaria].
verbo-->[soy];[es];[eres].
verbo-->[encuentro];[encontramos].
verbo-->[necesito];[necesitamos].
verbo-->[ocupo];[ocupamos];[ocuparemos];[ocupare].
verbo-->[gusta];[gustaria];[gustan].
verbo-->[tengo];[tenemos];[tendria];[tendriamos].
verbo-->[ubica];[ubicamos];[ubican];[ubico].   
verbo-->[queda];[quedo];[quedan].


infinitivo-->[].
infinitivo-->[ir];[viajar];[venir];[pasar];[llegar];[trasladar].
infinitivo-->[mover];[acudir];[asistir];[recorrer];[querer];[estar].
infinitivo-->[encontrar];[necesitar];[dirigir],[gustar];[tener];[ubicar].

pronombres-->[].
pronombres-->[yo].
pronombres-->[nosotros].
pronombres-->[el].
pronombres-->[ella].
pronombres-->[ellas].
pronombres-->[ellos].
pronombres-->[me].
pronombres-->[se].
pronombres-->[nos].

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
local-->[automercado].

adverbio-->[si];[no];[].
conjuncion-->[];[que].

oracion --> sintagma_nominal, sintagma_verbal.
oracion--> adverbio.
sintagma_nominal-->[].
sintagma_nominal --> pronombres.
sintagma_nominal --> preposiciones, articulo, local.
sintagma_nominal --> preposiciones, articulo, preposiciones, {lugar(X)},[X].
sintagma_verbal --> adverbio, verbo, conjuncion, infinitivo, sintagma_nominal.


lugar(X):-arco(X,_,_,_,_);arco(_,X,_,_,_).