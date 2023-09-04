class Empleado{
    String Apellido;
    String Nombre;
    Date FechaNacimiento;
    String cargo;
}

class Medico extends Empleado{
    // Hereda todas las propiedades y metodos de la clase padre
    String especialidad;
    String matricula;
}