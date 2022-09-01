const d = document;
d.addEventListener('DOMContentLoaded', () => {
    const prev = d.querySelector('.prev');
    const next = d.querySelector('.next');
    const items = d.querySelectorAll('.slide li');
    const buttons = d.querySelectorAll('.indicators button');
    
// Acciones del USuario
    prev.addEventListener('click', () => getItem(items, 'prev'))
    prev.addEventListener('click', () => getItem(buttons, 'prev'))
    prev.onclick = () => {
        getItem(items, 'prev');
        getItem(buttons,'prev');
    }
    next.onclick = () => {
        getItem(items, 'next');
        getItem(buttons,'next');
    }
    buttons.forEach( (btn, i) => btn.onclick = () => {
        getItem(items,'', i);
        getItem(buttons,'',i);
    } )
// Funcion Resolvente (determina que elemento debe mostrarse)
    const getItem = (array, direction, index) => {
        let newItem;
        for(i = 0; i < array.length; i++){
            if(array[i].classList.contains('active')){
                array[i].classList.remove('active');
                switch(direction){
                    case 'prev':
                        i > 0 ?
                        newItem = array[i - 1] :
                        newItem = array[array.length - 1]
                    break;
                    case 'next':
                        i < array.length - 1 ?
                        newItem = array[i + 1] :
                        newItem = array[0]
                    break;
                    default:
                        newItem = array[index];
                }
            }
        }
        newItem.classList.add('active');
    }   

//  Navegacion
    const menuBtn = d.querySelector('nav .btn');
    const menuList = d.querySelector('nav .menu');

    menuBtn.onclick = () => menuList.classList.toggle('active');
}   )