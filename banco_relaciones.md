## Objetos de un Sistema Bancario

```mermaid
graph TD;
    Banco-->Sucursal;
    Sucursal-->Empleado;
    Cliente-->Persona-->Cuenta;
    Cliente-->Empresa-->Cuenta;
    Cliente-->Cuenta;
    Cuenta-->CajaAhorro;
    Cuenta-->CuentaCorriente;
    Empleado-->AgenteCuenta-->Cliente;
    Empleado-->GerenteComercial-->Empleado;
    Empleado-->GerenteSucursal-->Sucursal;
```