export default class IpAddress {
    constructor (obj) { Object.assign(this, obj) }
    get(key) { return this[key] }
    set(key, value) { this[key] = value }
    assign = (Obj) => Object.assign(this, {...this, ...Obj})
    setNetwork(value) {
        if (this.regEx.test(value)) this.network = value.split(this.div);
        else this.message = "Formato de dirección inválido";
    }    
    powerCalc(value, host = false) {
        let bits = 0, power;
        do { bits++; power = (2**bits) - (host ? 2 : 0) } 
        while (power < value);
        this.bits = bits;
        return power;
    }
}