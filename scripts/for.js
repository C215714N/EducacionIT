/**
 * Arrays: Lista de elementos identificados por su Indice 
 *  let myArray = ["alpha", 2, true]
 *  myArray[0] // "alpha"
 * Objects: Elementos que poseen propiedades y valores, identificados por un indice nombrado
 *  let myObject = {
 *      nombre: "cristian",
 *      edad: 33
 *  }
 *  myObject.nombre // "cristian"
 *  myObect["edad"] // 33
 * Functions: Bloques de codigo que, pueden o no recibir parametros, y podemos llamar o invocar para su reutilizacion
 * function myFunction(){
 *  // codigo de mi funcion aqui
 * }
 * myFunction();
 */
const nav = document.getElementsByClassName('nav');
const links = ["index", "operators", "conditionals", "loops", "events"];
// Creamos un Nodo que contendra a los elementos
let lista = document.createElement("ul");
// iterador; codicion; intervalo
for(let i = 0; i < links.length; i++){
    lista.innerHTML+=`
    <li>
        <a href="${links[i]}.html">${links[i]}<a>
    </li>`
}
// Anidamos la lista y su contenido a la Navegacion
nav[0].appendChild(lista)