abstract class Persona{
    String nombre;
    String apellido;
    String tipoDoc;
    String numDoc;

    public void Persona(String n, String a, String td, String nd){
        this->nombre = n;
        this->apellido = a;
        this->tipoDoc = td;
        this->numDoc = nd;
    }
}

class Empleado extends Persona{
    String categoria;
    Float salario;
    Date fechaIngreso;
}
class EmpleadoAdministrativo extends Empleado{
    public void cobrarFactura(){

    }
    public void emitirNotaCredito(){

    }
    public void anularFactura(){

    }
}
class EmpleadoSupervisor extends Empleado{
    Array EmpleadoAdministrativo supervisados
    public void sansionarEmpleado(){

    }
    public void asignarTareas(){

    }
    public void asignarVacaciones(){
        
    }
}
class EmpleadoDirector extends Empleado{
    Array empleados
    public void contratarEmpleado(){

    }
    public void despedirEmpleado(){

    }
    public void promoverEmpleado(){

    }
    public void promoverEmpleado(String cargo){

    }
}