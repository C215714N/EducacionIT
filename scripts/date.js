/** RELOJ: Seccion de derechos de Autor */
const copy = d.querySelector('#footer .copy > span');
const timer = () => {
    const dateTime = new Date();
    return `
        ${  dateTime.getMonth() < 9 ? '0'+ (dateTime.getMonth() + 1) :
            dateTime.getMonth() + 1 }/${dateTime.getFullYear()}
        ${  dateTime.getHours()}:${dateTime.getMinutes()}:${dateTime.getSeconds() }`
}
let clock = setInterval(
    () => copy.innerHTML = timer(), 
    1000
);

//#Clase y Objeto Cronometro
class Clock {
    constructor(d, h, m, s){
        this.dd = d;
        this.hh = h;
        this.mm = m,
        this.ss = s;
    }
    // Metodos Propios
    adjustTime(value){
        return value < 10 ? '0'+ value : value
    }
    autoTime(key, value = 1){
        const newVal = parseInt(this[key]) + value || 0
        this.setTime(key, newVal)
    }
    // Getters
    getTime(){
        let t = ['dd','hh','mm','ss'].map(t => this.adjustTime(this[t]))
        return `${t[0]} - ${t[1]}:${t[2]}:${t[3]}`
    }
    getUnit(key){
        return this.adjustTime(this[key]);
    }
    // Setters
    setTime(key, value){
        // Valor Maximo de Tiempo
        (value >= 30 && key == 'dd') ||
        (value >= 60 && (key == 'ss' ||  key == 'mm')) ||
        (value >= 24 && key == 'hh') ?
            this[key] = 0 :
        // Valor Minimo de Tiempo (Min, Sec)
        (value < 0  && (key == 'mm' || key == 'ss')) ?
            this[key] = 59 :
        // Valor Minimo Tiempo (hh)
        (value < 0 && key == 'hh') ?
            this[key] = 23 :
        // Valor actual de Tiempo
            this[key] = value;
    }
}
const Cron = new Clock(0,0,0,0)
//#endregion
//#Cronometro
function clockStart(callback){ 
    // Iniciar el Intervalor (Cronometro)
    let runTimer = setInterval(()=>{
        // Incremento Segundos
        Cron.autoTime('ss')
        // Incremento por Minuto
        if (Cron.getUnit('ss') == 0) 
            Cron.autoTime('mm')
        // Incremento por Hora
        if (Cron.getUnit('ss') == 0 && Cron.getUnit('mm') == 0) 
            Cron.autoTime('hh')
        // Incremento por Dia
        if (Cron.getUnit('ss') == 0 && Cron.getUnit('mm') == 0 && Cron.getUnit('hh') == 0)
            Cron.autoTime('dd')
        // Asignacion de Valor
        callback();
    }, 1000 )
    // Detener el Intervalo (Cronometro)
    clockPause = () => clearInterval(runTimer)
    // Reiniciar el Intervalo  (Cronometro)
    clockStop = () => {
        clockPause();
        ['dd','hh','mm','ss'].map(t => Cron.setTime(t, 0))
        callback()
    }
}
//#endregion
//#Seccion HTML
function clockSection () {
    const main = d.querySelector('main');
    const section = d.createElement('section');
    Object.assign(section, {
        id: 'clockSection',
        className: 'grid auto jc-center',
        innerHTML: `
            <h2>Seccion de Relojes</h2>
            <p class="timer">${Cron.getTime()}</p>
            <div id="actionButtons" class="cron flex auto xs"></div>`
    } )
    main.appendChild(section);
    actionButtons();
}
//#endregion
//#Botones de Control
function actionButtons(){
    const container = d.getElementById('actionButtons');
    const controls = {
        input: ['dd','hh','mm','ss'],
        button: ['start', 'pause', 'stop']
    }
    Object.keys(controls).forEach( c => {
        for (let i = 0; i < controls[c].length; i++){
            let id = controls[c][i];
            let item = d.createElement(c);
            Object.assign(item, {
                id: `${c}_${id}`,
                placeholder: id,
                maxLength: 2,
                innerHTML: id.toUpperCase(),
                onclick: (e) => customAction(e),
                oninput: (e) => customAction(e)
            } )
            controls[c][i] = item;
            container.appendChild(controls[c][i]);
        }
    })
}
//#endregion
//#Asignacion de Acciones
function customAction(e){
    let id = e.target.id.split('_')[1];
    // Accion para los Botones
    if (e.target.id.includes('button_')){
        id = id.replace(id[0], id[0].toUpperCase());
        // Modificador del Texto Boton Start
        if (id == 'Pause'){
            d.getElementById('button_start').innerHTML = 'CONTINUE'
        }
        e.target.innerHTML = id.toUpperCase();
        // Consultar funcion por Nombre
        eval(`clock${id}(showTime)`)
    // Accion para los Inputs
    } else if (e.type == 'input') {
        Cron.setTime(id, e.target.value)
    }
}
function showTime(){
    const p = d.querySelector('#clockSection p')
    p.innerHTML = Cron.getTime()
}
//#endregion
clockSection();