import IPv4 from './IPv4.js';
import IPv6 from './IPv6.js';
import classfull from './model/classfull.json' with { type: 'json' };
import range from './model/range.json' with { type: 'json' };

const 
    events = ['input', 'click', 'keypress'],
    ipv4Regex = /((^|\.)((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]?\d))){4}$/,
    ipv6Regex = /((^|:)([0-9a-fA-F]{0,4})){1,8}$/,
    IPv4Network = new IPv4({ regEx: ipv4Regex, div: "." }),
    IPv6Network = new IPv6({ regEx: ipv6Regex, div: ":" }),
    addElement = (element, attributes) => Object.assign(
        document.createElement(element), { ...attributes, className: 'control' }
    ),
    options = (arr, key) => arr.map(obj => `<option>${obj[key]}</option>`).join(''),
    subnetCalc = () => ((parseInt(IPv4Network.cidr) || 24) + IPv4Network.bits || 0),
    updateForm = () => {
        const cidr = parseInt(frm.cidr.value) || 8;
        const bits = IPv4Network.bits || 0;
        frm.hosts.value = 2 ** (32 - cidr) - 2;
        frm.bits.value = bits;
    },
    form = () => { 
        const form = document.createElement('form');
        Object.keys(frm).forEach(key => form.append(frm[key]));
        return form;
    },
    root = document.getElementById('root'),
    frm = {
        ipClass: addElement('select', {
            innerHTML: options(classfull, 'class')
        }),
        network: addElement('input', { maxLength: 15 }),
        cidr: addElement('input', { type: 'tel', max: 32, disabled: true }),
        bits: addElement('input', { type: 'number', min: 0, value: 0 }),
        subnets: addElement('input', { type: 'number', min: 1, value: 1 }),
        hosts: addElement('input', { type: 'number', min: 0 })
    };
Object.values(frm).forEach(element => root.appendChild(element));

events.forEach(ev => {
    frm.ipClass.addEventListener(ev, function() {
        IPv4Network.addClass(classfull, this.value);
        frm.cidr.value = subnetCalc();
        updateForm();
        frm.subnets.addEventListener(ev, function() {
            IPv4Network.powerCalc(this.value);
            updateForm();
        });
        if (ev === "input") Object.values(frm).forEach(element => root.appendChild(element));
    });
});