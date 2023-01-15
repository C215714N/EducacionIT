const person = {
    // Propiedades
    name: 'cristian',
    age: 31,
    // Metodos
    saludar: function(){
        return 'hola a todos'
    }
}
// Prototipo (Funcion Constructora)
function Person (name, age){
    // Propiedades 
    this.name = name;
    this.age = age;
/** Metodos (Hereado por el Prototipo)
    this.presentarse = function () {
        return `Hola, mi nombre es ${this.name}`;
    }
*/ 
}
// Prototipo (Definicion de metodos)
Person.prototype.presentarse = function () {
    return `Hola, mi nombre es ${this.name}`;
}
// Objetos (Instancias de Person)
let instructor = new Person('cristian racedo', 31);
let alumno = new Person('juan perez', 22);
let cliente = new Person('jose jose', 65);

// Class (Molde Base)
class People {
    // Propiedades Privadas
    name;
    age;
    constructor(name, age){
        this.name = name;
        this.age = age;
    }
    // Metodos Publicos
    getAttr(attr){
        return this[attr]
    }
    setAttr(attr, newVal){
        this[attr] = newVal;
    }
    sayHi(){
        return `Hi, my name is ${this.name}`
    }
}
let cristian = new People('Cristian', 31)