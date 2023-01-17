
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