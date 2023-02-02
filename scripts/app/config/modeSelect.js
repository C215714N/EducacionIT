import { d } from "../global.js";

function modeSelect(object){
    const { mode } = object;
    const array = d.querySelectorAll('nav, header, footer, main *'),
    front = ['text', 'border', 'link'],
    back =  ['bg','navbar', 'table'],
    values = ['light', 'dark']

    array.forEach(item => {
    front.forEach((prop,i) => {
            if ( mode != 'CUSTOM'){
            let text, bg;
            switch(mode){
                case 0:
                case 'light':
                case 'LIGHT':
                    text = values[1];
                    bg = values[0]
                break;
                case 1:
                case 'dark':
                case 'DARK':
                    text = values[0];
                    bg = values[1]
                break;
            }
            replace(item, `${prop}-${bg}`,`${prop}-${text}`);
            replace(item, `${back[i]}-${text}`,`${back[i]}-${bg}`);
            }
            else {
            add(item, `${prop}-light`)
            add(item, `${back[i]}-warning`)
            values.forEach(color => {
                remove(item,`${prop}-${color}`)
                remove(item, `${back[i]}-${color}`)
            } ) }     
    } ) } )
}
// Manipulacion de clases
function replace(element, a,b){
    element.classList.replace(a,b);
    add(element, b);
}
function add(element, className){
    element.classList.add(className);
}
function remove(element, className){
    element.classList.remove(className);
}

export default modeSelect;