const tableListItems = document.querySelectorAll('.tables li');

i = 0;
// Bucles tabla de multiplicar
while (i < tableListItems.length){
    let n = 1;
    // Captura la lista dentro del elemento Actual
    let ul = tableListItems[i].querySelector('ul');
    i++
    // bucle interno (tabla actual)
    while (n <= 10){
        // Concatenamos el contenido de la etiqueta al nuevo valor
        ul.innerHTML+= "<li>" + i + "x" + n + "=" + (i * n) + "</li>";
        n++;
    }
}

let a = 10, b = 5;