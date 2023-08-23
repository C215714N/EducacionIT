function calcArea(b,h){
    return b * h; // salida del codigo
}
function triArea(b,h){
    let a = calcArea(b,h);
    return a / 2;
}
function circleArea(r){
    return Math.PI * r**2;
}

// SCOPE: Alcance de las variables
function a(c){ // 1
    console.log(c) // print 1
    c++ // 2
    function b(c){
        console.log(c) //  print 2
        c*= 5 // 10
        function d(c){
            console.log(c) // print 10
            c+= 10 // 20
            console.log(c) // print 20
        }
        d(c) // llama a d
        console.log(c) // print 10
    }
    b(c) // llama a b
    console.log(c) //  print 2
}

function newTag(tag='input', attr='type', type='number'){
    const input = document.createElement(tag);
        input.setAttribute(attr, type);
    return input;
}
const 
    div = newTag('div', 'class', 'container'),
    b = newTag(),
    h = newTag(),
    result = newTag('p', 'id', 'result');
    body = document.querySelector('body');

div.append(b,h,result);
body.prepend(div);

// Eventos
result.innerHTML = "Resultado "
b.oninput = function () {
    addText(result);
}
h.oninput = function () {
    addText(result)
}
function addText(el, f = calcArea(b.value,h.value), text = "Resultado: "){
    el.innerHTML = text + f;
}