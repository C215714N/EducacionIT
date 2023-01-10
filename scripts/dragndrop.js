const box = d.querySelector('#checkers .box');
const board = d.querySelector('#checkers .board');
const path = `assets/icon`

function createPiece(obj, index){
    let img = d.createElement('img')
    Object.assign(img, {
        id: obj.name + index,
        src: obj.src,
        draggable: true
    } )
    box.append(img);
}

function createBoard(){
    let tr = d.createElement('tr');

    board.append(tr);
}

function repeat(times, callback, params){
    for(let i = 1; i <= times; i ++){
        callback(params, i);
    }
}
repeat(12, createPiece, {
    id: 'red_',
    src: `${path}/red.svg`
})
repeat(12, createPiece, {
    id: 'black_',
    src: `${path}/black.svg`
})
