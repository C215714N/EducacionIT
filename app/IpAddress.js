export default class IpAddress {
    constructor (obj){ Object.keys(obj).map(key => this[key] = obj[key])}
    get = (key) => this[key]
    set = (key, value) => this[key] = value
    // Verificacion de formato IPv4 / IPv6
    setNetwork = (value) => this.regEx.test(value) ? 
        this.network = value.split(this.div) : 
        this.message = "Formato de direccion invalido"
    // Calculo Potencia 2^n para Subredes / Hosts
    powerCalc = (value, host = false, bits = 0) => {
        do (bits++, this.power = (2**bits) - (host ? 2 : 0 ))   
        while (this.power < value)
        return this.power
    }
}