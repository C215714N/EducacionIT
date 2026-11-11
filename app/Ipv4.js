import IpAddress from './IpAddress.js';

export default class IPv4 extends IpAddress {
    verify(ip) { return ip >= this.start[0] && ip <= this.end[0] }
    addClass(array, value) {
        const classObj = array.find(obj => value.toUpperCase() === obj.class);
        if (classObj) this.assign(classObj)
    }
    calcNextHop(value) {
        let i = 1, byte;
        do { byte = this.subnets / (2 ** ((8 * i) - 8)); i++ } 
        while (value > 2 ** (8 * i));
        this.nextHop = 256 / byte;
        return this.nextHop;
    }
}
