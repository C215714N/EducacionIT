
# Selectores Especiales

* [Combinadores](#combinadores)
* [PseudoClases](#pseudoclases)
* [PseudoElementos](#pseudoelementos)

## Combinadores

Símbolo que permite combinar dos o más selectores CSS, formando uno más complejo y potente. Se llaman así porqué proporciona una relación útil entre ellos y la ubicación del contenido en el documento.

| selector | descripcion | ejemplo | 
|--|--|--|
| __*__ | selecciona a todos los elementos | _div __*__ {...}_ |
| __>__ | elementos que sean hijos directos | _ul __>__ li {...}_ |
| __+__ | elemento que se encuentre al lado | _h1 __+__ p {...}_ |
| __~__ | elementos que sean hermanos  | _header __~__ p{...}_ |
| __[^]__ | atributos que empiecen con un valor | _a\[href **^=**"http"\]_ |
| __[*]__ | atributos que coincidan con un valor | _a\[href ***=**"www"\]_ |
| __[$]__ | atributos que terminen con un valor | _a\[href **$=**".com"\]_ |

## PseudoClases

Instancia o caracteristica de un elemento, ayudan a reducir el exceso de clases y proporcionan un marcado más flexible y fácil de mantener. Pueden interpretarse como el estado del mismo, actuando como si se hubiese aplicado una clase, ademas que poseen la misma jerarquia que estas.

| selector | Descripcion |
|--|--|
| __:hover__ | interviene si el usuario _pasa el cursor_ sobre un elemento |
| __:focus__ | interviene si el usuario _selecciona el elemento_ con los controles del teclado |
| __:link__ | __hipervinculo__ que aún no se ha visitado por el usuario |
| __:active__ | __hipervinculo__ o __boton__ cuando se presiona el boton primario del mouse |
| __:visited__ | __hipervinculo__ que ha sido visitado por el usuario |
| __:checked__ | __input__ de tipo _radio_ o _checkbox_ o etiqueta __option__ seleccionado |
| __:valid__ | _campo de formulario_ que cumple con sus atributos de validacion |
| __:invalid__ | _campo de formulario_ que no cumple con alguno de sus atributos de validacion |
| __:first-child__ | corresponde al _primer elemento_ entre un grupo de elementos hermanos |
| __:last-child__ | corresponde al _ultimo elemento_ entre un grupo de elementos hermanos |
| __:first-of-type__ | _primer elemento de su tipo_ entre un grupo de elementos hermanos |
| __:last-of-type__ | ultimo elemento de su t_ipo entre un grupo de elementos hermanos |
| __:nth-child(n)__ | uno o más elementos en función de su posición entre un grupo de hermanos |
| __:nth-last-child(n)__ | uno o más elementos en función de su posición, contando desde el final |

## PseudoElementos

Parte o elemento dentro de una etiqueta que, a diferencia de las pseudoclases, no describen un estado especial, sino que, permiten añadir estilos a una parte concreta del documento, como si se hubiese añadido un elemento HTML totalmente nuevo en el marcado.

| selector | Descripcion |
|--|--|
| __::before__ | permite agregar elementos antes del contenido de la etiqueta |
| __::after__ | permite agregar elementos despues del contenido de la etiqueta |
| __::first-line__ | corresponde a la primera línea de un elemento de bloque |
| __::first-letter__ | corresponde a la primera letra del contenido un elemento de bloque |
| __::placeholder__ | representa al _texto provisional_ en una etiqueta __input__ o __textarea__. |
| __::marker__ | corresponde a la _caja de marcadores_ de un __elemento de la lista__ |

[volver](../readme.md)