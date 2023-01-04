class User {
//  Propiedades Privadas
    #id = 0;
    #name = '';
    #username = '';
    #email = '';
    #address = Address;
//  Metodos Publicos
//  Constructor: se inicializa al instanciar la clase
    constructor(id, name, username, email, address){
        this.#id = id;
        this.#name = name;
        this.#username = username,
        this.#email = email,
        this.#address = address;
    }
//  Getters: metodos que permiten la obtencion de un valor    
    getUserId(){
        return this.#id;
    }
    getAddress(){
        return this.#address;
    }
    getUserName(){
        return this.#username;
    }
//  Setters: metodos que permiten definir un nuevo valor
    changeUserName(name){
        if(name.length >= 2 & name.length <= 20){
            this.#username = name
        } else {
            console.log('nombre de usuario no permitido, utilice otro');
        }
    }
}

class Address{
// Propiedades Privadas
    #street;
    #suite;
    #city;
    #zipcode;
    #geo = Geo;
//  Metodos Publicos
    constructor(street, suite, city, zipcode, geo){
    this.#street = street
    this.#suite = suite
    this.#city = city
    this.#zipcode = zipcode
    this.#geo = geo
    }
    // Getters:
    getGeo(){
        return this.#geo;
    }
    // Setters:
    changeZipCode(zip){
        if( parseInt(zip) >= 1000 && parseInt(zip) <= 2000){
            this.zipcode = zip
        } else {
            console.log('el codigo postal debe ser un numero entre 1000 y 2000');
        }
    }
}

class Geo {
    #lat;
    #lng;
    // Constructor:
    constructor(lat, lng){
        this.#lat = lat,
        this.#lng = lng;
    }
    // Getters:
    getCoordinates(){
        return (this.#lat, this.#lng)
    }
    // Setters:
    setCoordinates(lat, lng){
        this.#lat = lat
        this.#lng = lng
    }
}

// Objetos instanciados individualmente
// Localizacion
const geo = new Geo(-37.3159, 81.1496);
// Direccion
const address = new Address(
    'Av. siempreviva', 
    123, 
    'Buenos Aires', 
    '1832', 
    location
);
// Usuario
const user = new User(
    1, 
    'cristian', 
    'c215714n', 
    'cristiandracedo@hotmail.com', 
    address
)