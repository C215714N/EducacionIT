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

// Consultas JSONplaceholder
const
    d = document,
    w = window,
    server = 'https://jsonplaceholder.typicode.com',
    root = d.getElementById('root');

/** Funcion Asincrona */
async function fetchData(request){
    try {
        let data = await fetch(request.url);
        return await data.json();
    }
    catch (e){
        renderError(e)
    }        
}
