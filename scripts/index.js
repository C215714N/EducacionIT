window.addEventListener(
    'DOMContentLoaded', () => {
    // Declaraciones
    const d = document;
    const menuButton = d.querySelector('nav button.menu');
    const menuOptions = d.querySelector('nav ul.menu');

    // Menu Hamburguesa
    menuButton.addEventListener('click', 
        () => menuOptions.classList.toggle('active'))
}   )