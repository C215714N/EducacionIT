//#region Declaraciones
const box = d.querySelector('#checkers .box');
const board = d.querySelector('#checkers .board');
const btnStart = d.querySelector('#checkers button');
const path = `assets/icon`
const colors = ['red', 'black'];

//#endregion
//#region Funciones
/* Creacion de Ficha */
function createPiece(index, obj){
    let img = d.createElement('img')
    Object.assign(img, {
        id: `${obj.name}_${index}`,
        src: obj.src,
        draggable: true
    } )
    box.append(img);
}
/* Tablero  (Filas)*/
function boardRows(index){
    let tr = d.createElement('tr');
    repeat(8, boardCells, {tag: tr, index: index})
    board.append(tr);
}
/* Tablero (Celdas) */
function boardCells(i, obj){
    obj.tag.innerHTML+= `<td id="cell_${obj.index}${i}"></td>`;
}
/* Funcion de Repeticion */
function repeat(times, callback, params){
    for(let i = 1; i <= times; i ++){
        callback(i, params);
    }
}
//#endregion
//#region Eventos
    function dragEv(e){
        e.dataTransfer.setData('piece', e.target.id);
    }
    function dragOver(e){
        e.preventDefault();
        e.stopPropagation();
    }
    function dropEv(e){
        e.preventDefault();
        e.stopPropagation();
        let piece = e.dataTransfer.getData('piece');
        piece = d.getElementById(piece);
        e.target.append(piece);
    }
    function order(id){
        return (
            id[0] % 2 == 1 && id % 2 == 0
        )||(
            id[0] % 2 == 0 && id % 2 == 1
        )
    }
    function getEl(selector, all = true){
        return all ? d.querySelectorAll(selector) : d.querySelector(selector)
    }
    function setActions(){
        const pieces = getEl('#checkers img');
        const cells = getEl('#checkers td');

        pieces.forEach(p => p.addEventListener('dragstart', (e) => dragEv(e)))
        cells.forEach(c => {
            c.addEventListener('dragover', (e) => dragOver(e))
            c.addEventListener('drop', (e) => {
                let id = e.target.id.split('_')[1]
                if(order(id)) dropEv(e)
            })
        })
    }
    function start(){
        const pieces = getEl('#checkers img');
        const cells = getEl('#checkers td');
        
        let i = 0;
        cells.forEach(c => {
            let cell = c.id.split('_')[1];
            if(order(cell) && (cell[0] <= 3 || cell[0]>=6)){
                c.appendChild(pieces[i]);
                i++;
            }
        } )
    }
//#endregion
//#region DOM
// Insercion de Fichas
colors.forEach( color => repeat(12, createPiece, {
    name: color,
    src: `${path}/${color}.svg`
} ) )
// Creacion del Tablero
repeat(8,boardRows);
// Asignar Funciones
setActions();
btnStart.addEventListener('click', () => start())
//#endregion