## Clases Sistema de Hospital

```mermaid
graph TD;
hospital-->paciente
hospital-->empleado;
hospital-->articulo;
hospital-->especialidad;
empleado-->medico;
empleado-->administrativo;
medico-->seguimiento;
medico-->paciente;
medico-->especialidad;
medico-->consultorio;
medico-->habitacion;
especialidad-->condicion;
seguimiento-->paciente;
paciente-->condicion;
paciente-->habitacion;
paciente-->consultorio;
paciente-->cobertura;
articulo-->medicamento;
articulo-->instrumental;
```