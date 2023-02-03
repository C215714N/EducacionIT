"use strict";

// Declaraciones
var d = document,
    cN = 'active',
    // Galeria
slides = d.querySelectorAll('.gallery .item'),
    controls = d.querySelectorAll('.gallery [class*="icon-"]'),
    // Navegacion
menuButton = d.querySelector('nav .btn'),
    menuList = d.querySelector('nav .menu'),
    // Mapa de Contacto
mapButton = d.querySelector('#footer .btn.map'),
    mapFrame = d.querySelector('#footer iframe.map'); // Funciones

function toggle(object) {
  var target = object.target,
      btn = object.btn,
      className = object.className,
      val = object.val;
  target.classList.toggle(className) ? btn.classList.replace(val[0], val[1]) : btn.classList.replace(val[1], val[0]);
}

function getItem(object) {
  var array = object.array,
      className = object.className;
  var _iteratorNormalCompletion = true;
  var _didIteratorError = false;
  var _iteratorError = undefined;

  try {
    for (var _iterator = array[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
      el = _step.value;

      if (el.classList.contains(className)) {
        el.classList.remove(className);
        return el;
      }
    }
  } catch (err) {
    _didIteratorError = true;
    _iteratorError = err;
  } finally {
    try {
      if (!_iteratorNormalCompletion && _iterator["return"] != null) {
        _iterator["return"]();
      }
    } finally {
      if (_didIteratorError) {
        throw _iteratorError;
      }
    }
  }
}

function setItem(object) {
  var array = object.array,
      className = object.className,
      type = object.type,
      callback = object.callback;
  var item = callback(object);
  item = type == 'next' ? item.nextElementSibling || item.parentNode.firstElementChild : type === 'prev' ? item.previousElementSibling || item.parentNode.lastElementChild : array[type];
  item.classList.add(className);
} // Eventos
// Galeria


controls.forEach(function (btn) {
  return btn.addEventListener('click', function () {
    setItem({
      array: slides,
      className: cN,
      type: btn.className.split('-')[1],
      callback: getItem
    });
  });
}); // Navegacion 

menuButton.addEventListener('click', function (e) {
  return toggle({
    target: menuList,
    btn: e.target,
    className: cN,
    val: ['icon-open', 'icon-close']
  });
}); // Mapa de Contacto

mapButton.addEventListener('click', function (e) {
  return toggle({
    target: mapFrame,
    btn: e.target,
    className: cN,
    val: ['icon-plus', 'icon-less']
  });
});