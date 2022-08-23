/* Declaraciones */
var variableGlobal; // alcance global, reasignable y redeclarable
let  variableLocal; // alcance local, reasignable y no redeclarable
const Constantine = 'no puede cambiar'; // alcance local, no reasignable y no redeclarable

/* Captura de Elementos */
let copy = document.getElementById('copy');
// getElementById('id'); devuelve el primer elemento con el ID especificado
// getElementsByClassName('content'); devuelve una lista (array) de elementos con la CLASE seleccionada
// getElementsByTagName('p'); devuelve una lista de elementos que correspondan con la Etiqueta indicada
// querySelector('#copy'); devuelve el primer elemento que coincida con el selector

let today = new Date(); // Instancia del Objeto Fecha
let day = today.getDate(); // Extrae el dia de la fecha (22)
let month = today.getMonth(); // Extrae el mes de la fecha (07)
let year = today.getFullYear(); // Extrae el año completo (4 digitos)
let message = '&copy;' + year + ' Todos los derechos reservados'; // Contenido a representar
/* ----------------------------------------------------------- */
copy.innerHTML += message; // Asignacion del valor en el elemento HTML

// Condicional simple
if(day < 15){
    alert('Vamos que recien empieza'); // valor si se cumple la condicion
} else {
    alert('Ya falta poco para que termine'); // valor si no se cumple la condicion
}