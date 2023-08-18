// Formas antiguas 
    const listItems = document.getElementsByTagName('li'); // Lista de elementos (etiquetas)
    const box = document.getElementsByClassName('box'); // Lista de elementos (clases)
    const header = document.getElementById('header'); // Elemento capturado (Id)

// Ecmascript
    const li = document.querySelector('.box li'); // Elemento capturado (Selector CSS) || No admite ::before ni ::after
    const list = document.querySelectorAll('.box li'); // Lista de elementos (Selector CSS) || No admite ::before ni ::after

// Manipulación del DOM
    let darkTheme = window.confirm('¿vas a utilizar el tema oscuro?')
    let deg;

    if (darkTheme){
        header.style.color = "rgb(238, 238, 238)"
        header.style.backgroundColor = "#448"
        deg = 180;
    } 
    else {
        header.style.color = "#333"
        header.style.backgroundColor = "hsl(240, 50%, 70%)"
        deg = 0;
    }

// Bucle WHILE (Funciona "mientras" se cumpla la condicion)
    let i = 0;
    // Condicion que debe cumpirse
    while (i < list.length){
        // Codigo a implementar
        list[i].style.backgroundColor = "hsl(" + (i * 30 + deg) + ", 50%, 50%)";
        list[i].innerHTML = "Tema: " + listItems[i].innerHTML;
        // Movemos el iterador
        i++;
    }