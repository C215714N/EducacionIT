/*  Ejemplo JavaScript

    class User{
    // Propiedades Publicas
    // Se definen cuando se crea el objeto
    // No se pueden modificar directamente
    // Solamente son accesibles mediante metodos
        #userName;
        #userEmail;
        #userPass;
    
    // Metodos Publicos
    // acctiones que involucran al objeto
    // getters: funcion utilizada para devolver un valor
    // setters: funcion utilizada para cambiar un valor
        setUserName(string user){
            this.userName = user;
        }
        getUserName(){
            return this.userName
        }
    }
*/

// Ejemplo C#
class User {
    private string userName;
    private string userEmail;
    private string userPass;

    public void setUserName(string user){
        this.userName = user;
    }
    public string getUserName(){
        return this.userName
    }
}

// OBJETO: Instancia de la Clase User
cristian = new User();
// ERROR: Propiedad de tipo privado (No se puede modificar)
cristian.userName = 'cristian';
// OK: Invoca al metodo y permite el cambio del valor
cristian.setUserName('critian');