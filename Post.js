/*  Ejemplo C#
    class Post{
    // Metodo Constructor: 
    // Define los valores predeterminados del Objeto
    // Se invoca automaticamente al instanciar la clase
        Post(args){...}
        
    // Metodo Destructor: 
    // Elimina el Objeto instanciado
    // Libera espacio en memoria 
    // No hace retorno de valor
        ~Post(){...}
    }
*/
// Ejemplo JavaScript
class Post{
    constructor(args){
        this.id = args.id;
        this.userId = args.userId;
        this.postTitle = args.postTitle;
        this.postDescription = args.postDescription;
        this.product = new Product(args.product);
        this.stock = args.stock
        this.price = args.price
        this.postDate = new Date();
        this.updateTimes = args.updateTimes || 0;
        this.postUpdate = new Date();
    }
}