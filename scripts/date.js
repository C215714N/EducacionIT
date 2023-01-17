
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
    adjustTime(value){
        return value < 10 ? '0'+ value : value
    }
    getTime(){
        let h = this.adjustTime(this.hr)
        let m = this.adjustTime(this.min)
        let s = this.adjustTime(this.sec)
        return `${h}:${m}:${s}`
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
    setTime(key, value){
        (value >= 60 && key != 'hr') ||
        (value >= 24 && key == 'hr') ?
        this[key] = 0 :
        this[key] = value;
    }
}

let Cron = new Clock(0,0,0)
let runTimer = setInterval(()=>{
    Cron.setTime('sec', Cron.getSecond() + 1)
    
    if (Cron.getSecond() == 0) 
        Cron.setTime('min', Cron.getMinutes() + 1)
    if (Cron.getMinutes() == 0 && Cron.getSecond() == 0) 
        Cron.setTime('hr', Cron.getHours('hr') + 1)

    console.log(Cron)
}, 1)