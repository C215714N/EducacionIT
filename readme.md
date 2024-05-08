# Maquetador Web Avanzado

Esto es una guia para los alumnos de la capacitacion __Maquetacion web con HTML y CSS__ que cursan los dias _miercoles y viernes de 14hs a 17hs_, donde podran acceder a los contenidos vistos en clase.

## Background

Esta propiedad se utiliza para definir los valores individuales del fondo de una etiqueta. Se puede usar para definir los valores de una o de todas las siguientes propiedades.

| Background | Descripcion |
|--|--|
| __background-attachment__ | Propiedad que determina si la image se fijara con respecto a la pantalla o la etiqueta contenedora. |
| __background-color__ | Propiedad define el color de fondo de un elemento, puede ser un valor o la palabra _"transparent"_ |
| __background-image__ | Propiedad que establece una o más imágenes de fondo para un elemento, utilizando la funcion _url()_ |
| __background-position__ | Propiedad que define donde inicia la imagen, admite las palabras clave _top center bottom left y right_ |
| __background-size__ | Propiedad que especifica el tamaño de las imágenes, admite valores y palabras clave como _cover y contain_ |
| __background-repeat__ | Propiedad que define como se repiten los fondos, puede ser  sobre el _eje horizontal, vertical, ambos o ninguno_ |

## Flexbox

__El Módulo de Caja Flexible__ fue diseñado como un _modelo unidimensional de layout_, y como un método que pueda ayudar a _distribuir el espacio entre los ítems de una interfaz_ y mejorar las capacidades de alineación. Para crear un contenedor flex, establecemos la propiedad display del contenedor como __flex__ o __inline-flex__. Tan pronto como hacemos esto, __los hijos directos de este se vuelven ítems flex__.

| Flexbox |Descripcion|
|--|--|
| __justify-Content__ | propiedad usada para alinear los ítems en el eje principal. El valor inicial es flex-start que alineará los ítems al inicio del margen del contenedor |
| __align-items__ | propiedad que alinea los ítems sobre el eje cruzado. El valor inicial es stretch y haciendo que los ítems se ajusten a la altura del más alto, para llenar el contenedor |
| __flex-direction__ | propiedad que permite cambiar la dirección de los ítems. El valor row-reverse mantiene el despliegue a lo largo de la fila, pero el inicio y final quedarán invertido |

## CSS Grid

__CSS Grid layout__ contiene funciones de diseño dirigidas a los _desarrolladores de aplicaciones web_. El CSS grid se puede utilizar para lograr muchos diseños diferentes. También se destaca por permitir __dividir una página en áreas o regiones principales__, por definir la relación en términos de tamaño, posición y capas entre partes de un control construido a partir de primitivas HTML.

| Grid | Descripcion |
|--|--|
|__grid-template-columns__ | Propiedad que especifica el número y ancho de las columnas en un diseño de cuadrícula, en una lista separada por espacios |
|__grid-template-rows__ | Propiedad que especifica el número y las alturas de las filas en un diseño de cuadrícula, donde cada valor especifica la altura de las filas |
|__grid-template-areas__ | Propiedad que especifica áreas dentro del diseño de cuadrícula, donde cada área está definida por apóstrofes |

## Position

Esta propiedad especifica cómo un elemento es posicionado en el documento. Las propiedades _top, right, bottom, y left_ determinan la ubicación final de los elementos posicionados. Sin embargo, estas propiedades no funcionarán a menos que la propiedad __position__ se establezca primero.

| Position | Descripcion |
|--|--|
| __static__ | El elemento no está posicionado de ninguna manera especial, ya que siempre se posiciona de acuerdo con el flujo normal de la página
| __relative__ | El elemento se posiciona respecto al flujo normal de la pagina, y se coloca en relación a si mismo. El resto del contenido no se ajustará para encajar en ningún espacio dejado por el elemento. |
| __absolute__ | El elemento es removido del flujo normal de la pagina y se coloca en relación con el ancestro posicionado más cercano; sin embargo, si no posee ancestro con posición, utiliza al elemento raiz.
| __fixed__ | El elemento es removido del flujo normal de la pagina y se coloca en relación con la ventana, permaneciendo en el mismo lugar, incluso si se desplaza la página.
| __sticky__ | El elemento es posicionado de acuerdo al flujo normal de la pagina y luego es desplazado con relación a su ancestro que se desplace más cercano, en función al desplazamiento del usuario.

## Efectos Visuales

css posee muchas caracteristicas que, antiguamente, hubiesen requerido el uso de programas como los de __paquete de Abobe__ _Photoshop, Illustrator o Flash(Animate)_ para implementarlas dentro de una pagina web. Nos referimos a la modificacion del aspecto de las etiquetas, asi como tambien el uso de animaciones.

### Transformaciones

Corresponden a valores que podemos aplicar sobre las etiquetas sin afectar el flujo del documento; pueden ser __transformaciones 2d__ que no dependen de ningun contexto o __transformaciones 3d__ donde es necesario definir una _perspectiva_ en alguno de los elementos padre. Cabe mencionar que dentro del atributo transform se pueden aplicar mas de un efecto simultaneamente.

| Transform | Descripcion |
|--|--|        
| __translate(`x`,`y`)__ | Desplazamiento relativo del elemento sobre los ejes horizontal y vertical, se pueden definir individualmente con los valores _trasnlateX_ y _translateY_ |
| __scale(`x`,`y`)__ | Escala del elemento, si se utiliza un solo valor modifica ambos ejes, aunque tambien pueden definirse individualmente con los valores _scaleX_ y _scaleY_|
| __rotate(`deg`)__ | Rotacion del elemento que, por defecto, se realiza en _sentido horario_ y admite cualquier angulo expresado en __grados__ o la palabra reservada _turn_. |
| __skew(`x`,`y`)__ | Sesgado del elemento que permite su inclinacion modificando los __grados__ de sus _angulos interiores_. Se puede definir con los valores _skewX_ y _skewY_ |
| __translateZ(`z`)__ | Desplazamiento sobre el _eje de profundidad_, se necesita definir una perspectiva para su funcionamiento porque, caso contrario, no habria cambios en el elemento.
| __rotateX(`deg`)__ | Rotacion sobre el eje horizontal que necesita la definicion de un __punto de fuga__ ya que de lo contrario, se aplicaria una transformacion de escala vertical. |
| __rotateY(`deg`)__ | Rotacion sobre el eje vertical que necesita la definicion de un __punto de fuga__ ya que de lo contrario, se aplicaria una transformacion de escala horizontal. |
| __perspective__ | Define la distancia entre el usuario y el eje Z, y su relacion en inversamente proporcional con los elementos hijos, _a menor valor la transformacion es mas notoria_. |
| __transform-origin__ | Define el punto al partir del cual se aplican las transformaciones sobre el elemento, admite valores como _top right bottom left y center_ y coordenadas sobre los ejes _x y_|
| __perspective-origin__ | Establece el punto de vista del usuario, es decir, el _punto de fuga_ para las transformaciones de cualquier elemento hijo que utilice el __eje de profundidad__ |

### Transiciones

Atributo que permite conseguir _un efecto suavizado entre un estado inicial y un estado final_ al realizar una acción, pero solamente es aplicable a las propiedades que son cuantificables y para que se efectue correctamente, debemos tener un estado inicial y un estado final, caso contrario, el navegador podría no saber uno de esos estados y por lo tanto, no podría efectuar la transición.

| Transition | Descripcion |
|--|--|
| __transition-property__ |	Propiedad CSS afectada, admite palabras clave como __all__ y __none__ |
| __transition-duration__ |	Tiempo que tardara la transicion _expresado en segundos_ | 
| __transition-timing-function__ |	Ritmo de la transicion, determina cuando es mas lenta o rapida
| __transition-delay__ | Tiempo de espera _en segundos_ , para que se ejecute la transicion | 
