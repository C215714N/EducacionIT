## TIPOS DE OPERADORES

### ARITMETICOS
| signo | representacion| ejemplo | salida |
|-------|---------------|---------|--------|
 __+__	|suma           | 4 + 6   | 10
 __-__	|resta          | 15 - 10 | 5
 __*__	|multiplicacion |  3 * 8  | 24
 __/__	|division       |  10 / 5 | 2
 __%__	|modulo         |  13 / 2 | 1

### COMPARACION
| signo   |representacion|ejemplo | salida |
|---------|--------------|--------|--------|
  __=__	  |igual a       | 10 = 5 | false
  __>__	  |mayor que     | 20 > 2 | true
  __>=__	|mayor o igual | 5 >= 5 | true
  __<__	  |menor que     | 10 < 10| false
  __<=__	|menor o igual | 8 <= 20| true
  __!=__	|no es igual   | 3 != 7 | true
  __<>__	|distinto a    | 2 <> 2 | false

### LOGICOS
| signo | representacion | ejemplo        | salida |
|-------|----------------|----------------|--------|
__AND__	| si "a" y "b"   | 2>0 AND 5<4    | false
__NOT__	| si no "a" 	   | NOT 4>=2       | false
__OR__ 	| si "a" o "b"   | 2>0 OR 5<4     | true
__XOR__	| si "a" y no "b"| 10>5 XOR 10<5  | true
__LIKE _'%a%'___	|  si existe valor similar  | "texto" LIKE "%ex%" | true
__IN _(a,b)___		| si el valor es "a" o "b" | 2 IN(1,3,4) | false
__BETWEEN _a_ AND _b___ | si esta entre "a" y "b" | 2 BETWEEN 1 AND 4 | true

[volver al inicio](../readme.md)
