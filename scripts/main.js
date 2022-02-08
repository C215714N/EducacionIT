// Declaraciones
    const d = document
    const pBars = d.querySelectorAll('.progress progress')
    const pIns = d.querySelectorAll('.progress input[type="number"]')

// Barra de progreso
    pIns.forEach((control,i) => control.addEventListener('input', () => pBars[i].value = control.value ))