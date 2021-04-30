menuBtn = document.querySelector('nav .button')
menuLst = document.querySelector('nav .menu')

menuBtn.onclick = () => menuLst.classList.toggle('active') ? menuBtn.innerHTML = '&times;' : menuBtn.innerHTML = '&equiv;'