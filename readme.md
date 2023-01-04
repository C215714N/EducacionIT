# Introduccion al paradigma de Objetos

Esto es una guia para los alumnos del curso de POO de la fundacion pescar

## Elementos que conforman POO

* __Clase:__ Molde utilizado como base para la creacion de los objetos
* __Objeto:__ Instancia de una clase, elemento creado a partir de una clase
* __Propiedad:__ atributos o caracteristicas de los objetos
* __Metodo:__ funciones o acciones que puede realizar los objetos

### Javascript
```
    class Person {
    // Propiedades
        #name;
    // Metodos
        getName () {
            return "Mi nombre es " + this.name;
        }
        setName (name) {
            this.name = name;
        }
    }
```

### Python
```
    class Person:
    # Propiedades
        str name;
    # Metodos
        def get_name (self):
            return "Mi nombre es " + self.name
        def set_name (self, name):
            self.name = name
```

### C#
```
    class Person {
    // Propiedades
        private string name;
    // Metodos
        public string getName (){
            return "Mi nombre es " + this.name;
        }
        public void setName(string name){
            this.name = name;
        }
    }
```

## Propiedades y metodos

Cuando creamos una clase es conveniente que las propiedades sean definidas como __"PRIVADAS"__ y por otro lado, que sus metodos sean __"PUBLICOS"__. Ya que de esta forma solamente se prodran cambiar los valores de las mismas a traves de los metodos, para brindar una mayor seguridad.

```
const p1 = new Person();
// ERROR: Atributo Privado (No se puede modificar directamente)
p1.#name = 'cristian';
// VALIDO: Utilizo el metodo para definir el nuevo nombre (permite verificar los valores)
p1.setName('cristian');

```