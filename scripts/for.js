let limit = 10;
// Bucle For: Estructura que define en su declaracion un iterador, la condicion y el incremento del mismo.
for (let i = 0; i <= limit ; i++){
    document.write(i + '<br>');
}

// funcion: bloque de codigo que define los parametros con valores por defecto
function printIt(start = 0, end = 10, power = 2){
    for (let i = start; i <= end; i++){
        // accion de salida
        document.write("<li>" + i**power + "</li>");
} }

document.write("<h2>Cuadrados</h2>");
document.write("<ul>");
    printIt(); // llamada a la funcion sin argumentos (valores predeterminados)
document.write("</ul>");

document.write("<h2>Cubos</h2>");
document.write("<ul>");
    printIt(3,9,3); // llamada a la funcion con argumentos
document.write("</ul>");

document.write("<h2>Cuarta</h2>");
document.write("<ul>");
    printIt(4,8,4); // llamada a la funcion con argumentos
document.write("</ul>");

