// Definicion de Clases
class User {
    constructor(userName, email, password){
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.isActive = true;
        this.isAdmin = false;
    }
    changePassword(oldPass, newPass){
        if (oldPass === this.password){
            if (newPass[0] == newPass[1])
            this.password = newPass[0]
        }
    }
}
class AdminUser extends User{
    static isAdmin = true;
    changePassword(user, password){
        user.password = password
    }
}
class clientUser extends User{
    static isAdmin = false;
    constructor(){
        super(...arguments)
    }
    changeStatus(value){
        this.isActive = value || !(this.isActive)
    }
}
// Declaraciones
let session;
const signinForm = document.getElementById("signin")
const loginForm = document.getElementById("login")

// Creacion de Cuenta de Usuario
signinForm.addEventListener('submit', (ev) => {
    ev.preventDefault()
    // Funciones de Utilidad
    const get = (attr) => ev.target[attr].value // captura de valor
    const pwd = (n) => ev.target.pass[n].value // captura de contraseña
    // Verificacion de Contraseñas
    if(pwd(0) == pwd(1)) 
        session = new clientUser(get("user"),get("email"),pwd(0))
    else alert ("verifique los datos ingresados")
})
loginForm.addEventListener('submit', (ev) => {
    ev.preventDefault()
})