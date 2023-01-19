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
    constructor(M, d, h, m, s){
        this.MM = M || 0;
        this.dd = d || 0;
        this.hh = h || 0;
        this.mm = m || 0,
        this.ss = s || 0;
    }
    // Metodos Propios
    adjustTime(value){
        return value < 10 ? '0'+ value : value;
    }
    autoTime(key, value = 1){
        const newVal = parseInt(this[key]) + value || 0;
        this.setTime(key, newVal);
    }
    // Getters
    getKeys(){
        return Object.keys(this);
    }
    getTime(){
        let t = this.getKeys().map(t => this.adjustTime(this[t]));
        return `${t[0]}/${t[1]} - ${t[2]}:${t[3]}:${t[4]}`;
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
const Cron = new Clock()
//#endregion
//#Cronometro
function clockStart(callback){ 
    // Iniciar el Intervalo (Cronometro)
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
        Cron.getKeys().map(t => Cron.setTime(t, 0));
        callback();
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
            <p class="clock timer w-100">${Cron.getTime()}</p>
            <div id="actionButtons" class="cron flex auto xs jc-center"></div>`
    } )
    main.appendChild(section);
    actionButtons();
}
//#endregion
//#Botones de Control
function actionButtons(){
    const container = d.getElementById('actionButtons');
    const controls = {
        input: Cron.getKeys(),
        button: ['start', 'pause', 'stop']
    }
    Object.keys(controls).forEach( c => {
        for (let i = 0; i < controls[c].length; i++){
            let id = controls[c][i];
            let item = d.createElement(c);
            Object.assign(item, {
                id: `${c}_${id}`,
                placeholder: id,
                className: (c == 'button' ? 'clock btn' : 'time btn'),
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
        let start = d.getElementById('button_start');
        if (id == 'Pause'){
            start.innerHTML = 'CONTINUE'
        } else if (id == 'Stop'){
            start.innerHTML = start.id.split('_')[1].toUpperCase();
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