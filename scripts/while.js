if (confirm('¿Desea crear la lista de alumnos?')){
    // Capturamos el Elemento HTML
    const totalStudents = document.getElementById('totalStudents')
    const listaEstudiantes = document.getElementById('students');
    let cantidad = 0;
    // Asignamos un nuevo valor a cantidad
    cantidad = prompt('¿Cuantos alumnos deseas cargar?');
    totalStudents.innerHTML = "La cantidad de Alumnos Ingresados es de <strong>" + cantidad + "</strong>"
    // Mientras se cumpla la condicion (se ejecuta el codigo)
    while (cantidad > 0){
        // Creamos una etiqueta
        let elemento = document.createElement('li');
        // Asignamos su contenido
        elemento.innerText = prompt("¿Como se llama el alumno " + cantidad + "?");
        // Insertamos la etiqueta en el DOM
        listaEstudiantes.appendChild(elemento);
        // Descuenta 1 de la cantidad
        cantidad--
    }
}