## Objetos de un Sistema Bancario

```mermaid
graph TD;
    Banco-->Sucursales;
    Sucursales-->Empleados;
    Clientes-->Persona-->Cuentas;
    Clientes-->Empresa-->Cuentas;
    Clientes-->Cuentas;
    Cuentas-->CajaAhorro;
    Cuentas-->CuentaCorriente;
    Empleados-->AgenteCuenta-->Clientes;
    Empleados-->GerenteComercial-->Empleados;
    Empleados-->GerenteSucursal-->Sucursal;
```