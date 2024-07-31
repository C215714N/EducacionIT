class Person{
    // Propiedades Privadas
    #name
    #age
    // Metodos Publicos
    // constructor
    constructor(name, age){
        this.#name = name;
        this.#age = age;
    }
    // Getters
    getName(){
        return this.#name;
    }
    getAge(){
        return this.#age;
    }
    // Setters
    setName(name){
        this.#name = name;
    }
    setAge(age){
        this.#age = age;
    }
}
// Instancia
const user = new Person("cristian",18)
user.setAge(33)