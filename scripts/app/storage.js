function Storage(object){
    const { key, value, type, action } = object;
    let store = type ? localStorage : sessionStorage;

    switch (action){
        // guarda en Storage
        case 0: 
        case false: 
        case 'save':
        case 'SAVE': 
        case 'guardar': 
        case 'GUARDAR':
            store.setItem(key, JSON.stringify(value));
        break;
        // Cargar del Storage
        case 1: 
        case true: 
        case 'load': 
        case 'LOAD': 
        case 'cargar': 
        case 'CARGAR':
            return JSON.parse(store.getItem(key));
    }
}

export default Storage;