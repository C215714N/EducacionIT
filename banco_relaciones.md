Objetos de un Sistema Bancario

```mermaid
graph TD;
    Banco-->Sucursales;
    Clientes-->Persona;
    Clientes-->Empresa;
    Cuentas-->CajaAhorro;
    Cuentas-->CuentaCorriente;
    Empleados-->AgenteCuenta-->Clientes;
    Empleados-->GerenteComercial-->Empleados;
    Empleados-->GerenteSucursal-->Sucursal;
```