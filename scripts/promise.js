// Promise
const promise = new Promise((resolve, reject) => {
    const value = Math.random() * 100;
    if(value >= 60){
        resolve(value)
    }
    else{
        reject(value)
    }
})

promise
.then(resultado => console.log('promesa cumplida: ' + resultado))
.catch(error => console.log('promesa rechazada: ' + error))