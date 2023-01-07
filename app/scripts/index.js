class UserData{
    id = 0;
    name = '';
    username = '';
    email = '';
    address = new Address;
    phone = '';
    website = '';
    company = new Company;

    constructor(name, username, email, phone, website){
        this.name = name;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.website = website;
    }
    // getters: cualquier propiedad Publica
    get(property = [], callback){
        property.map(p => callback(this[p]))
    }
    // setters: cualquier propiedad Publica
    set(property = {}){
        let keys = Object.keys(property);
        keys.map(k => this[k] = property[k])
    }
    phoneValidation(phone, callback){
        const regexp = /^\+|\(\d{2,6}\)(\d{2,4}\-){1,4}\d{4}/;
        if( regexp.test(phone)){
            this.phone = phone;
            callback('felicitaciones, se ha cambiado el numero de telefono');
        }else {
            callback('ingrese un numero telefonico valido');
        }
    }
    webValidation(web, callback){
        const regexp = /^([a-zA-Z_\-]{2,}\.){1,3}[A-Za-z]{2,6}$/
        if(regexp.test(web)){
            this.website = web;
            callback('felicitaciones, se ha actualizado el nombre del sitio web');
        } else {
            callback('el nombre del sitio no cumple con los requisitos para ser validado');
        }
    }
}

class Address{
    #street = '';
    #suite = '';
    #city = ''
    #zipcode = 0;
    geo = new GeoLocation;

    constructor(street, city, zipcode){
        this.#street = street;
        this.#city = city;
        this.#zipcode = zipcode;
    }
}

class GeoLocation{
    #lat = 0;
    #lng = 0;
}

class Company{
    #name = '';
    #catchPhrase = '';
    #bs = '';
    constructor(name, phrase, bs){
        this.#name = name;
        this.#catchPhrase = phrase;
        this.#bs = bs;
    }
}

const cristian = new UserData(
    'cristian',
    'c215714n',
    'cristiandracedo@hotmail.com', 
    '11-0303-456',
    'cristian.great-site.net'
)
const everGreen = new Address(
    'avenida siempreviva',
    'springfield',
    1832
)
const educacionIT = new Company(
    'EducacionIT',
    'El futuro es hoy',
    'Tecnologia, Informatica, Comunicacion'
)

cristian.set({
    address: everGreen,
    company: educacionIT
} )