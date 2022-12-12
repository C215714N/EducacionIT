# JavaScript Desarrollador Avanzado

La siquiente es una guia teorico-practica realizada con la finalidad de profundizar sobre los temas tratados en clase

## Tabla de contenidos
1. [tipos de datos](tipos-de-datos)
1. [constructores](constructores)
1. [modelo de objetos](modelo-de-objetos)

## Tipos de datos
Hacen referencia a la minima porcion de información que se trabaja, también se puede considerar como el rango de valores que puede tomar una variable durante la ejecución del programa. 

Si bien javascript utiliza tipado dinamico, es decir que se puede modificar la clase o atributo de los datos ingresados, en el estandar de ECMAScript se definen los siguientes grupos de datos:

### Primitivos
* __Number__: Entero o decimal, numero que ocupa 64 bits de espacio en memoria
* __String__: Secuencia de caracteres utilizada para representar texto
* __Boolean__: Dato lógico que solo puede tener los valores true o false.
* __Symbol__: Utilizado para añadir claves de propiedades únicas a un objeto.
* __Undefined__: Valor asignado a los argumentos formales sin argumentos reales.
* __Null__: Referencia que apunta a un objeto o dirección inexistente o inválido.
### Objetos
* __Array__: Objetos similares a una lista cuyo prototipo proporciona métodos para efectuar operaciones de recorrido y de mutación.
* __Object__: Estructura que contiene datos e instrucciones para trabajar, es usado para guardar una colección de datos definidos y entidades más complejas.
* __Function__: fragmento de código que puede ser llamado por otro código o por sí mismo, o por una variable que haga referencia a la función

## Constructores
Una variable es un contenedor para un valor, como un número que va a ser utilizado en una suma, o una cadena de texto como parte de una oración. Pero los valores que estas contienen pueden cambiar.

Podemos declarar variables utilizando cualquiera de las _instrucciones var, let y const_. Cada una posee su propias caracteristicas, como se muestran en la tabla que aparece a continuacion:

| __inicializador__ | var 	| let 	| const |
|-------------------|-------|-------|-------|
| __Alcance__ 	    | global| local | local |
| __Redeclarable__	| si 	| no	| no 	|
| __Redefinible__ 	| si 	| si 	| no 	|

## Modelos de Objetos

### BOM (Browser Object Model)
El objeto __window__ es compatible con todos los navegadores y representa la ventana del Navegador. 

No existen estándares oficiales para el modelo de objetos de navegador debido a que los navegadores modernos han implementado los casi los mismos métodos y propiedades para la interactividad de JavaScript.


|Propiedad|Descripcion|
|-|-|
|innerHeight| Devuelve el alto interno de la ventana|
|innerWidth| Devuelve el ancho interno de la ventana|
|outterHeight| Devuelve el alto total de la ventana|
|outterWidth| Devuelve el ancho total de la ventana|
|location| Devuelve el objeto Ubicacion |
|history| Devuelve el objeto Historial |
|navigator| Devuelve el objeto Navegador |

Todos los objetos, funciones y variables globales se convierten automáticamente en miembros del objeto de window. Las variables globales son propiedades del objeto window y las funciones globales son métodos.

|Metodo|Descripcion|
|-|-|
|alert(`message`)| Muestra un mensaje en pantalla |
|prompt(`message`)| Cuadro de dialogo para el ingreso datos |
|confirm(`message`)| Cuadro de dialogo de confirmacion |
|open(`URL`, `name`, `specs`)|Abre una nueva ventana |
|resizeTo(`width`, `height`)| Establece las dimensiones de la ventana |
|resizeBy(`width`, `height`)| Aumenta el tamaño de la ventana |

### DOM (Document Object Model)
Cuando se carga una página web, el navegador crea un modelo de objeto de documento de la página. El modelo HTML DOM se construye como un árbol de objetos

El HTML DOM es un modelo de objeto estándar y una interfaz de programación para HTML. Se define:

* Los elementos HTML como objetos
* Las propiedades de todos los elementos HTML
* Los métodos para acceder a todos los elementos HTML
* Los eventos para todos los elementos HTML

|Propiedad|Descripcion|
|-|-|
|title| Devuelve el titulo de la pestaña|
|URL| Devuelve la direccion URL de la pagina|
|characterSet| Devuelve la codificacion de caracteres utilizada|
|head| Devuelve el objeto __HEAD__ del documento|
|body| Devuelve el objeto __BODY__ del documento|
|links| Devuleve un array de objetos __&lt;A>__ |
|images| Devuelve un array de objetos __&lt;IMG>__ |
|activeElement| Devuelve el elemento que posee el foco|

En otras palabras: el HTML DOM es un estándar sobre cómo obtener, cambiar, agregar o eliminar elementos HTML.

|Metodo|Descripcion|
|-|-|
|createElement(`tag`)| Crea un Elemento HTML|
|getElementById(`id`)| Devuelve el objeto con el id especificado
|getElementsByClassName(`className`)| Devuelve un array de objetos por su nombre de clase
|getElementsByName(`name`)| Devuelve un array de objetos con el atributo name
|getElementsByTagName(`tagname`)| Devuelve un array de objetos por su tipo de etiqueta
|querySelector(`selector`)| Devuelve el primer elemento que coincide con un selector CSS
|querySelectorAll(`selector`)| Devuelve una lista de nodos que coinciden con un selector CSS
|addEventListener(`event`,`function`)| Adjunta un controlador de eventos al documento|
