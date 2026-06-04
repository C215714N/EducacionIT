# Algoritmo Diffie-Hellman

En el intercambio de claves Diffie-Hellman, los números primos se utilizan como base para la generación de claves criptográficas. Un número primo grande, junto con un generador (número entero), se acuerda entre las partes que desean comunicarse de forma segura. La seguridad del protocolo se basa en la dificultad de resolver el problema del logaritmo discreto en un campo finito, que es intrínseco a los números primos. 

## Propiedades

* __Tamaño__: El número primo _(p)_ utilizado debe ser lo suficientemente grande para resistir ataques de fuerza bruta. Se recomienda un tamaño de _2048bits_ o mayor. 
* __Generador__: Debe ser una raíz primitiva módulo p, lo que significa que las potencias de este _(g)_ producen todos los _números entre 1 y p - 1_. 
* __Factorización__: Para asegurar que el protocolo sea seguro, el número _(p - 1)_ debe tener un factor primo grande, lo cual ayuda a prevenir ciertos tipos de ataques. 
* __Primos Seguros (opcional)__: Aquellos con la forma _p = 2q + 1_, donde q también es primo, proporciona una capa adicional de seguridad en algunos casos. 

## Funcionamiento

| Componente | Simbolo | Descripcion |
|--|--|--|
| __Número primo__  |  p  | Entero mayor a 1, divisible por 1 y por sí mismo. Un primo grande mejora la seguridad del algoritmo |
| __Generador__ | g | Entero menor que p. Al elevar g a diferentes potencias (módulo p), se deben generar todos los números entre 1 y p-1 |
| __Clave privada__ | a & b | Número secreto elegido por cada participante de la comunicacion |
| __Clave pública__ |  A & B | Calculado elevando el generador a la potencia de la clave privada (módulo p) |
| __Clave compartida__ |  mod p | Calculado tomando la clave pública del otro participante, elevándola a la potencia de la clave privada propia |

## Ejemplo: 

* __Numero Primo__: 5
* __Generador__: 3

| Clave | Op.Host A | Op.Host B |
|-|-|-|
| __Privada__ | $\textbf{a}=4$ | $\textbf{b}=2$ | 
| __Publica__ | $\textbf{A}=g^a\mod p\equiv3^4\%5=1$ | $\textbf{B}=g^b\mod p\equiv3^2\%5=4$ |
| __Compartida__ | $\textbf{S}=B^a\mod p\equiv4^4\%5=1$ | $\textbf{S}=A^b\mod p=1^2\%5=1$ |

[volver](../readme.md)