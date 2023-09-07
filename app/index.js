class Persona{
    // Propiedades privadas	
    #nombre; 
    #apellido; 
    #fechaNac; 
    #genero; 
    #tipoId; 
    #numeroId;
    // Metodos Publicos
    constructor(n,a,fn,g,ti,ni){
        this.#nombre    = n;
        this.#apellido  = a;
        this.#fechaNac  = fn;
        this.#genero    = g;
        this.#tipoId    = ti;
        this.#numeroId  = ni;
    }
    // Getters
    get(key){
        return this[key]
    }
    // Setters
    set(key, value){
        if (value == null || value == undefined || value == '') {
            return "valor no asignado"
        } else {
            eval(`this.#${key} = ${value}`)
        }
    }
}

class Paciente extends Persona{
    #grupoSanguineo;
    #peso;
    #estatura;
    #alergias;
    #enfermedades;

    constructor(gs,p,e,al,en,...args){
        super(...args);
        this.#grupoSanguineo = gs;
        this.#peso = p;
        this.#estatura = e;
        this.#alergias = al;
        this.#enfermedades = en;
    }
}

const 
    d = document,
    pacientes = [],
    frmPaciente = d.getElementById('patient');

frmPaciente.addEventListener('submit', (e) => {
    e.preventDefault();
    // Asignacion directa
    const p = new Paciente(
        // Datos de paciente
        frmPaciente.grupoSanguineo.value,
        frmPaciente.peso.value,
        frmPaciente.estatura.value,
        frmPaciente.alergias.value,
        frmPaciente.enfermedades.value,
        // Datos de persona
        frmPaciente.nombre.value,
        frmPaciente.apellido.value,
        frmPaciente.fechaNac.value,
        frmPaciente.genero.value,
        frmPaciente.tipoId.value,
        frmPaciente.numeroId.value
    )
    pacientes.push(p);
    // Asignacion iterativa
    frmPaciente.querySelectorAll('[name*=""]').forEach(control => { p.set(control.name, control.value) } )
})