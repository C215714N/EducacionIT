# PPP

__Point to Point Protocol__ funciona a nivel de enlace de datos y es utilizado para establecer una _conexión directa entre dos nodos_ de red, permitiendo conectar routers directamente sin ningún equipo u otro dispositivo de red entre ambos. Cuando configuramos este protocolo se establecen dos subcapas LCP y NDP

1. router(config-if)# __(Protocolo Punto a Punto)__
    * __encapsulation `ppp`__: define el metodo de encapsulamiento a nivel de capa 2
    * __ppp quality `<percentage>`__: determina el porcentaje de calidad de comunicacion.
2. router (config-if)# __(Definicion de Credenciales)__
    * __hostname `R1`__: esteblece el nombre de host local para la conexion punto a punto.
    * __username `R2` password `Abc123!`__: define un usuario con el nombre del host remoto.
3. router (config-if)# __(Protocolo de Autenticacion por contraseña)__
    * __ppp authentication `pap`__: establece pap como metodo de autenticacion
    * __ppp pap sent-username `R1` password `Abc123!`__: establece las credenciales que seran validadas por el host remoto.
4. router(config-if)# __(Protocolo de Autenticacion por desafio mutuo)__
    * __ppp authentication `chap`__: establece chap como metodo de autenticacion
    * __ppp authenticacion `chap` `pap`__: metodos de autenticacion principal y secundario

## Implementacion

La implementación de PPP debe considerar el tipo de enlace y requisitos de autenticación:
1. **Enlaces seriales WAN (Frame Relay, MPLS)**: PPP como encapsulamiento estándar. Se usa CHAP por su seguridad mutua. Consideraciones:
   - Interfaz clock rate en DCE: `clock rate 64000`
   - Keepalives para detección de fallos: `keepalive 10`
2. **Enlaces dedicados punto a punto (circuitos privados)**: PAP suficiente si el enlace está físicamente seguro. Simplifica troubleshooting por menor complejidad.
3. **Enlaces de backup (4G/5G)**: PPP con autenticación por token o certificado. Se implementa `ppp chap hostname` con nombre único por sitio.
4. **Consideraciones de seguridad**:
   - CHAP es preferible: no envía contraseña en claro
   - Usar contraseñas complejas (>10 caracteres, mezcla de tipos)
   - Documentar peer names y passwords en sistema de gestión seguro
5. **Troubleshooting común**:
   - Verificar LCP: `show interfaces` para `line protocol is up`
   - Estado de autenticación: `debug ppp authentication`
   - NAT traversal: `show ppp interface` para ver direcciones asignadas
6. **Configuración mutua**: Ambas extremidades deben tener credenciales cruzadas (R1 conoce a R2 y viceversa).

```sh
! Router R1 (lado DCE)
hostname R1
!
username R2 password CISCO_PASS_SEGURA
!
interface Serial0/1/0
 description CONNECTION_TO_R2
 encapsulation ppp
 ppp authentication chap
 clock rate 64000
!
! Router R2 (lado DTE)
hostname R2
username R1 password CISCO_PASS_SEGURA
!
interface Serial0/1/0
 description CONNECTION_TO_R1
 encapsulation ppp
 ppp authentication chap
```

[volver](../readme.md)