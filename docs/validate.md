# Validacion de Datos

Herramienta que permite __restringir el tipo de datos o los valores__ que los usuarios pueden ingresar en una celda, permitiendo mantener la integridad y coherencia de la informacion.

| Tipo | Descripcion |
|-|-|
| __Lista__ | Permite seleccionar valores de una lista desplegable |
| __Numero Entero__ | Solo permite numeros enteros dentro de un rango |
| __Decimal__ | Permite numeros decimales dentro de un rango |
| __Fecha__ | Restringe a fechas especificas o rangos de fechas |
| __Hora__  | Limita a horas especificas |
| __Longitud de texto__ | Controla la cantidad de caracteres permitidos |
| __Formula personalizada__ | Usa una formula para definir reglas mas complejas |

## Implementacion

1. Selecciona la celda o rango de celdas.
2. Ve a la pestaña __Datos__ → __Validacion de datos__.
3. En la pestaña __Configuracion__, elige el tipo de validacion.
4. Define los criterios (por ejemplo, rango de valores, lista, formula).
5. (Opcional) Configura mensajes de entrada y error.

## Tipos de Mensajes

* __Entrada__: Aparece cuando el usuario selecciona la celda. Sirve como guia.
* __Error__: Se muestra si el usuario ingresa un valor no valido.

| Alerta | Descripcion
|-|-|
| __Detener__ | Impide la entrada de datos no validos |
| __Advertencia__ | Permite continuar, pero muestra una advertencia |
| __Informacion__ | Solo informa, pero permite cualquier entrada |

## Ejemplos

| Escenario | Validacion |
|-|-|
| Lista de paises | Lista: `Argentina, Brasil, Chile` |
| Edad entre 18 y 65 | Numero entero: minimo 18, maximo 65 |
| Fecha posterior a hoy | Fecha: `=HOY()+1` |
| Texto de maximo 10 caracteres | Longitud de texto: maximo 10 |
| Solo emails validos (basico) | Formula: `=Y(ESNUMERO(HALLAR("@",A1)),ESNUMERO(HALLAR(".",A1)))` |
| Valores mayores al promedio | Formula: `=A1>PROMEDIO($A$1:$A$10)` |
| Solo texto en mayusculas | Formula: `=EXACTO(A1,MAYUSC(A1))` |

## Limitaciones

* No se puede aplicar validacion a celdas combinadas
* Las listas no admiten referencias a otras hojas, excepto nombres definidos
* La validacion no impide que se peguen valores invalidos
* No es retroactiva: no afecta valores ya ingresados

[volver](../readme.md)