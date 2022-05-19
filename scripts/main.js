// Declaraciones
    const d = document
    const mapFrame = d.querySelector('#footer .map iframe');
    const mapButton = d.querySelector('#footer .map .btn');

// Eventos
    mapButton.onclick = () => {
        // Operador Ternario condicion ? valor V : valor F
        mapFrame.classList.toggle('active') ? 
        // codicion (se agrego la clase active)
            mapButton.classList.replace('icon-max','icon-min') : 
            // si se cumple (se reemplaza icon-max por icon-min)
            mapButton.classList.replace('icon-min','icon-max') 
            // de lo contrario (se reemplaza icon-min por icon-max)
    }
