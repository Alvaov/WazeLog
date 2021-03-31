:-consult(dijkstra).
%Análisis de lenguaje estructural

%Signos de puntuacio Definidos 
puntuacion-->[,];[].

%Preposiciones 
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

%Articulos 
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

%Verbos 
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

%Infinitivos
infinitivo-->[].
infinitivo-->[ir];[viajar];[venir];[pasar];[llegar];[trasladar].
infinitivo-->[mover];[acudir];[asistir];[recorrer];[querer];[estar].
infinitivo-->[encontrar];[necesitar];[dirigir],[gustar];[tener];[ubicar].

%Pronombres 
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

%locales de la ciudad
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

%Adverbios 
adverbio-->[si];[no];[].

%Conjunciones 
conjuncion-->[];[que].

/*
    Based: Universidad de sevilla's code
    Modified: Alejandro Vasquez
    Descripcion basica de una oracion, compuesta por un sintagma nominal y un sintagma verbal
*/
oracion --> sintagma_nominal, sintagma_verbal.

/*
    Author: Alejandro Vasquez Oviedo
    Description: for the context of the program the user input can be just an adverb
*/
oracion--> adverbio.

/* 
    Based: Universidad de sevilla's code
    Modified: Alejandro Vasquez
    Descripcion: The sintagma nominal can be void    
*/
sintagma_nominal-->[].
/* 
    Based: Universidad de sevilla's code
    Modified: Alejandro Vasquez
    Descripcion: The sintagma nominal just a pronoun  
*/
sintagma_nominal --> pronombres.
/* 
    Based: Universidad de sevilla's code
    Modified: Alejandro Vasquez
    Descripcion: The sintagma nominal can be a preposition, a article and a local, with the puntuation between them if needed    
*/
sintagma_nominal --> preposiciones,puntuacion, articulo, puntuacion,local.
/* 
    Based: Universidad de sevilla's code
    Modified: Alejandro Vasquez
    Descripcion: The sintagma nominal can be a preposition, a article and a place in the graph, with the puntuation between them if needed    
*/
sintagma_nominal --> preposiciones,puntuacion, articulo,puntuacion, preposiciones, puntuacion,{lugar(X)},[X].
/* 
    Based: Universidad de sevilla's code
    Modified: Alejandro Vasquez
    Descripcion: The sintagma verba; can have a adverb, a verb, a comjuntion, and infinitive and a sintagma nominal, if one of them can be void 
*/
sintagma_verbal --> adverbio,puntuacion, verbo,puntuacion, conjuncion,puntuacion, infinitivo,puntuacion, sintagma_nominal.

/*  
    Author: Alejandro Vasquez 
    Description: Verifies if a place is in the graph used 
    lugar(+Ubicacion)
        *Ubicacion: A place given to verifie if it is in the graph

*/
lugar(Ubicacion):-arco(Ubicacion,_,_,_,_);arco(_,Ubicacion,_,_,_).