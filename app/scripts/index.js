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
    nameValidation(name){
        const regexp = /[a-z A-Z ñÑ']{2,50}/
        if (regexp.test(name)){
            this.name = name;
            return 'felicitaciones, el nombre ingresado es valido'
        } else {
            return 'debe ingresar un nombre que posea solamente caracteres de texto'
        }
    }
    userValidation(user){
        const regexp = /^[a-zA-Z]{2}\w{2,18}$/
        if(regexp.test(user)){
            this.user = user;
            return 'felicitaciones, el nombre de usuario se encuentra disponible'
        } else {
            return 'ingrese un nombre que empiece con 2 letras, y que posea como maximo 20 caracteres alfanumericos'
        }
    }
    mailValidation(mail){
        const regexp = /\w{2,}@(\w{2,}\.[A-Z a-z]{1,})/
        if (regexp.test(mail)){
            this.email = mail;
            return 'felicitaciones, el correo ha sido verificado'
        } else {
            return 'ingrese una direccion de correo valida que incluya un arroba'
        }
    }
    phoneValidation(phone){
        const regexp = /^\+|\(\d{2,6}\)(\d{2,4}\-){1,4}\d{4}/;
        if(regexp.test(phone)){
            this.phone = phone;
            return 'felicitaciones, se ha cambiado el numero de telefono';
        } else {
            return 'ingrese un numero telefonico valido';
        }
    }
    webValidation(web){
        const regexp = /^([a-zA-Z_\-]{2,}\.){1,3}[A-Za-z]{2,6}$/
        if(regexp.test(web)){
            this.website = web;
            return 'felicitaciones, se ha actualizado el nombre del sitio web';
        } else {
            return 'el nombre del sitio no cumple con los requisitos para ser validado';
        }
    }
    passValidation(pass){
        const regexp = /^((?=[a-z]+)(?=[A-Z]+)(?=[0-9])+(?=[-_!#$]+)){8,}/
        if (regexp.test(pass)){
            this.password = pass;
            return 'felicitaciones, la contraseña ha sido verificada'
        }
    }
    passVerification(pass){
        if(this.password == pass){
            return 'las contraseñas han sido verificadas'
        } else {
            return 'las contraseñas no coinciden'
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

/** Intregacion de POO en el DOM */
let user = {};

document.addEventListener('click', (e) => {
    e.stopPropagation();
    const tag = e.target;

    if(tag.tagName === 'A'){
        switch (tag.href.split('#')[1]) {
            case 'signUp':
                user = new UserData();
            break;
            case 'signIn':
                console.log('iniciar sesion')
            break;
            default:
                console.log('no hay hash')
            break;
        }
    }

} )

document.addEventListener('input', (e) => {
    const tag = e.target;

    if(tag.tagName === 'INPUT'){
        let response = ''
        const p = tag.nextElementSibling || document.querySelector(`#${tag.id} ~ .validation`);

        switch(tag.id){
            case 'name':
                response = user.nameValidation(tag.value);
            break;
            case 'userName':
                response = user.userValidation(tag.value);
            break;
            case 'email':
                response = user.mailValidation(tag.value);
            break;
            case 'firstPass':
                response = user.passValidation(tag.value);
            break;
            case 'secondPass':
                response = user.passVerification(tag.value);
            break;
            case 'phone':
                response = user.phoneValidation(tag.value);
            break;
            case 'website':
                response = user.webValidation(tag.value);
            break;
            default:
                response = 'no hay coincidencia';
        }
            p.innerHTML = response;
    }
} )