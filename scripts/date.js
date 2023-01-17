
const copy = d.querySelector('#footer .copy > span');

const timer = () => {
    const dateTime = new Date();
    return `
        ${  dateTime.getMonth() < 9 ? 
            '0'+ (dateTime.getMonth() + 1) : 
            dateTime.getMonth() + 1 }/${dateTime.getFullYear()} 
        ${dateTime.getHours()}:${dateTime.getMinutes()}:${dateTime.getSeconds()}`
}

let clock = setInterval(
    () => copy.innerHTML = timer(), 
    1000
);

class Clock {
    constructor(h, m, s){
        this.hr = h;
        this.min = m,
        this.sec = s;
    }
    // Metodos Propios
    adjustTime(value){
        return value < 10 ? '0'+ value : value
    }
    autoTime(key, value = 1){
        this.setTime(key, this[key] + value)
    }
    // Getters
    getTime(){
        let t = ['hr','min','sec'].map(t => this.adjustTime(this[t]))
        return `${t[0]}:${t[1]}:${t[2]}`
    }
    getHours(){
        return this.hr
    }
    getMinutes(){
        return this.min;
    }
    getSecond(){
        return this.sec;
    }
    // Setters
    setTime(key, value){
        // Valor Maximo de Tiempo (Hr, Min, Sec)
        (value >= 60 && key != 'hr') ||
        (value >= 24 && key == 'hr') ?
            this[key] = 0 :
        // Valor Minimo de Tiempo (Min, Sec)
        (value < 0  && key != 'hr') ?
            this[key] = 59 :
        // Valor Minimo Tiempo (Hr)
        (value <0 && key == 'hr') ?
            this[key] = 23 :
        // Valor actual de Tiempo
            this[key] = value;
    }
}

let Cron = new Clock(0,0,0)
let runTimer = setInterval(()=>{
        Cron.autoTime('sec')
    if (Cron.getSecond() == 0) 
        Cron.autoTime('min')
    if (Cron.getMinutes() == 0 && Cron.getSecond() == 0) 
        Cron.autoTime('hr')

    console.log(Cron.getTime())
}, 1000 )