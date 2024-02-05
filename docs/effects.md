# Efectos Visuales

* [Transform](#transform)
* [Transition](#transition)
* [Animation](#animation)

## Transform 

Propiedad que permite manipular el sistema de coordenadas de un elemento usando las funciones de transformación y pueden aplicarse simultaneamente.

### Funciones Bidimensionales

Corresponden a cambios que podemos realizar sobre un elemento como transladar, mover, rotar o sesgar; sin afectar el flujo del documento y no dependen de ningun contexto. La propiedad __transform-origin__ permite modificar el _origen de las transformaciones_ de un elemento.

| Funcion | Descripcion | Ejemplo |
|--|--|--|
| __translate__ | Desplaza al elemento sobre los ejes X,Y. Si no se indica se asume que es 0 | __translate(_1rem,-.5rem_)__ |
| __scale__ | Escalado de un elemento, que puede especificarse para los ejes X,Y | __scale(_1.5_)__ |
| __rotate__ | Rotación de un elemento en sentido horario, expresada en grados | __rotate(_15deg_)__ |
| __skew__ | Sesga el elemento a lo largo de los ejes X,Y por los ángulos especificados | __skew(_15deg, 30deg_)__ |

### Funciones Tridimensionales

Para poder implementar este tipo de cambios debemos definir la propiedad de __perspective__ qué indica cuan lejos está el objeto del usuario y la propiedad de __perspective-origin__ la cual indica desde qué posición el usuario mira el elemento posicionado. Al definir estas propiedades, son los _elementos hijos_ los que obtienen la vista en perspectiva y por lo tanto a quienes podemos aplicar las funciones de transformacion.

| Funcion | Descripcion | Ejemplo |
|--|--|--|
| __translateZ__ | Mueve el elemento a través del eje Z en el espacio tridimensional | __translateZ(_5rem_)__ |
| __rotateX__ | Rotación de un elemento sobre el eje X para crear una perspectiva | __rotateX(_30deg_)__ |
| __rotateY__ | Rotación de un elemento sobre el eje Y para crear una perspectiva | __rotateY(_15deg_)__ |
| __perspective__ | Distancia entre el usuario y el plano tridimensional | __perspective(_2rem_)__ |

## Transition

Conjunto de propiedades que proporcionan una forma de controlar la velocidad de la animación al cambiar las propiedades entre dos estados de un elemento. Hay diferentes estados que pueden ser definidos utilizando pseudo-clases como _:hover_, _:active_, _:focus_, etc; o aplicado _dinámicamente usando JavaScript_ y en lugar de que los cambios de propiedad surtan efecto inmediatamente, puede hacer que los cambios se realicen durante un período de tiempo determinado.

| Propiedad | Descripcion |
|--|--|
| __transition-property__ | Nombres de las propiedades en las que debe aplicarse la transición |
| __transition-duration__ | Tiempo que debe tardar una animación de transición en completarse |
| __transition-timing-function__ | Establece cómo se calculan los valores intermedios de la transición. |
| __transition-delay__ | Tiempo de espera entre un cambio de atributo y el comienzo de la transicion |

## Animation

Conjunto de propiedades que permiten a un elemento cambiar gradualmente de un estilo a otro, se pueden cambiar tantas propiedades como sean necesarias, asi como tambien, la cantidad de veces que se requiera. Para utilizar la animación CSS, primero se deben especificar algunos fotogramas clave para la animación utilizando la regla __@keyframes__, indicando los estilos que tendrá el elemento en determinados momentos.

| Propiedad | Descripcion |
|--|--|
| __animation-name__ | Lista de animaciones que se deben aplicar al elemento seleccionado |
| __animation-duration__ | Tiempo que tarda la animación en completar un ciclo  |
| __animation-timing-function__ | Indica como debe avanzar sobre la duración de cada ciclo |
| __animation-delay__ | Tiempo de retardo que debe transcurrir antes de comenzar la animación |
| __animation-direction__ | Establece el sentido de reproduccion, de inicio a fin o viceversa |
| __animation-iteration-count__ | Cantidad de veces que un ciclo de animación debe ser ejecutado antes de detenerse |
| __animation-fill-mode__ | Manera en la que se aplican los estilos, estableciendo persistencia y estado final |
| __animation-play-state__ | Determina si una animación se encuentra en ejecución o pausada |

### Timing-function

Una timing function definida dentro de un keyframe afecta a ese keyframe. Si no está definida para el keyframe, se aplica la timing function para la animación en general. A menudo, es conveniente usar la propiedad abreviada animation para ajustar las propiedades de animación una sola vez.

| Valor | Descripcion |
|--|--|
| __ease__ | Animacion con inicio lento, luego rápido y finaliza lentamente |
| __linear__ | Especifica una animación con una _velocidad constante_ |
| __ease-in__ | Especifica una animación con un __inicio lento__ |
| __ease-out__ | Especifica una animación con un __final lento__ |
| __ease-in-out__ | Especifica una animación con un __inicio y un final lentos__ |
| __cúbic-bezier(x1,y1,x2,y2)__ | Permite definir valores de _progreso_ en funcion del _tiempo_ |

[volver](../readme.md)