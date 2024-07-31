## JSON (JavaScript Object Notation)

Es un __formato de intercambio de datos__ ligero que es fácilmente legible para las personas y fácil de analizar gramaticamente por las máquinas. Los objetos JSON se definen utilizando __pares clave-valor__ y _se representan entre llaves {}_.

```json
"Person": {
    "firstName": "cristian",
    "lastName": "racedo",
    "age": 33
}
```
## XML (Extensible Markup Language)

Es un __lenguaje de marcado__ que se utiliza para __almacenar y transportar datos__ de forma estructurada. Los objetos se definen utilizando _etiquetas y atributos_.

```xml
<Person>
    <firstName>cristian</firstName>
    <lastName>racedo</lastName>
    <age>33</age>
</Person>
```
## Array Asociativo

También conocido como mapa, diccionario, es una __estructura de datos__ que asocia claves con valores. A diferencia de los arrays tradicionales en un las _claves pueden ser de cualquier tipo de datos inmutable_, como cadenas, números u objetos.

```php
$Person = [
    "firstName" => "cristian",
    "lastName" => "racedo",
    "age" => 33
];
```