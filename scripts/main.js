//  Declaraciones
    const d = document
    const menuBtn = d.querySelector('#header button')
    const menuLst = d.querySelector('#header .menu')
    const pBars = d.querySelectorAll('.progress progress')
    const pIns = d.querySelectorAll('.progress input[type="number"]')
    const mVids = d.querySelectorAll('.media :is(audio, video)')
    const mBtns = d.querySelectorAll('.media .btn-play')
    const mapBtn = d.querySelector('#footer button.fa')
    const mapFrm = d.querySelector('#footer iframe.cover')

//  Menu Hamburguesa
    menuBtn.onclick = () => 
        menuLst.classList.toggle('active') ? 
            menuBtn.classList.replace('fa-bars', 'fa-times') : 
            menuBtn.classList.replace('fa-times', 'fa-bars') 

//  Barra de progreso
    pIns.forEach((control,i) => control.addEventListener('input', () => pBars[i].value = control.value ))

//  Contenido Multimedia
    mBtns.forEach((button, i) => button.onclick = () => {
        let text
        mVids[i].paused ? ( mVids[i].play(), text = 'PAUSE' ) : ( mVids[i].pause(), text = 'PLAY' )
        button.innerHTML = text
    })
    
//  Mapa de Contacto
    mapBtn.onclick = () => { mapFrm.classList.toggle('active') ?
        mapBtn.classList.replace('fa-expand', 'fa-compress') :
        mapBtn.classList.replace('fa-compress', 'fa-expand')
    }