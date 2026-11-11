
// IpAddress.js
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
        this.bits = bits
        return this.power
    }
}
// Ipv4.js
import IpAddress from './IpAddress.js';

export default class IPv4 extends IpAddress{
    assign = (Obj) => Object.keys(Obj).map(k => this[k] = Obj[k])
    verify = (ip) => ip >= this.start[0] && ip <= this.end[0]
    addClass = (array, value) => array.map((Obj) => {
        if(value.toUpperCase() === Obj.class) this.assign(Obj)            
    } )
    calcNextHop(value, byte, i = 1){
        do (byte = this.subnets / 2**((8*i) - 8), i++)
        while(value <= 2**(8*i))
        return this.nextHop =  256 / byte
    }
}
// Ipv6.js
import IpAddress from './IpAddress.js';
import range from './model/range.json' assert {type:'json'};

export default class IPv6 extends IpAddress{

    
}
// index.js
import IPv4 from './IPv4.js';
import IPv6 from './IPv6.js';
import classfull from './model/classfull.json' assert {type: 'json'};

const 
    // Values Declarations 
    events = ['input', 'click' , 'keypress'],
    ipv4 = /((^|\.)((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]?\d))){4}$/,
    ipv6 = /((^|:)([0-9a-fA-F]{0,4})){1,8}$/,
    // Object Prototypes 
    IPv4Network = new IPv4({ regEx:ipv4, div:"." }),
    IPv6Network = new IPv6({ regEx:ipv6, div:":" }),
    // Public Functions
    add = (element, attributes) => Object.assign(
        document.createElement(element), { ...attributes, className: 'control' } ),
    options = (arr, key) => arr.map( obj =>`<option>${obj[key]}</option>`),
    subnetCalc = () => ((parseInt(IPv4Network.cidr)||24) + IPv4Network.bits||0),
    form = (obj) => { 
        const form = document.createElement('form');
        Object.keys(obj).map( key => {
        
            form.append()
        })
    }
    // DOM Nodes
    root = document.getElementById('root'),
    frm = {
        ipClass: add('select', { innerHTML: options(classfull, 'class') }),
        network: add('input',  { maxLength:15 }),
        cidr:    add('input',  { type:'tel',    max: 32, disabled: true }),
        bits:    add('input',  { type:'number', min: 0,  value: 0 }),
        subnets: add('input',  { type:'number', min: 1,  value: 1 }),
        hosts:   add('input',  { type:'number', min: 0  })
    }
;

root.append(frm.ipClass)

events.forEach( ev => frm.ipClass.addEventListener(ev, function () {
    IPv4Network.addClass(classfull, this.value)

    frm.cidr.value = subnetCalc
    frm.hosts.setAttribute("value", 2**((32-frm.cidr.value) || 8) - 2)

    frm.subnets.addEventListener(ev, function(){
        IPv4Network.powerCalc(this.value)
        
        frm.hosts.setAttribute("value", 2**((32-frm.cidr.value) || 8) - 2)
        frm.cidr.value = subnetCalc 
        frm.bits.setAttribute("value", IPv4Network.bits)
    })
    
    root.append(frm.network, frm.subnets, frm.cidr, frm.bits, frm.hosts)

} ) )
