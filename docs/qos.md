# QoS

__Quality of Service__ es un conjunto de tecnologías que permite gestionar y priorizar el tráfico de red para asegurar un rendimiento adecuado de las aplicaciones y servicios. Se utiliza para garantizar que el tráfico más importante reciba un mayor ancho de banda y baja latencia.

1. router(config)# __(Configuración de QoS básica)__
    * __class-map match-any `<class-name>`__: Define un conjunto de clases de tráfico.
    * __match `<match-condition>`__: Establece las condiciones que debe cumplir el tráfico para coincidir con la clase.
    * __policy-map `<policy-name>`__: Define una política QoS.
    * __class `<class-name>`__: Aplica una clase a la política.
    * __priority `<value>`__: Establece la prioridad de los paquetes en la clase.
    * __bandwidth `<value>`__: Asigna un ancho de banda mínimo garantizado a la clase.
2. router(config)# __(Aplicación de QoS a una interfaz)__
    * __interface `<interface-id>`__: Accede a la interfaz de configuración.
    * __service-policy output `<policy-name>`__: Aplica la política QoS de salida.
    * __service-policy input `<policy-name>`__: Aplica la política QoS de entrada.
3. router(config)# __(Configuración de Cola de Prioridad)__
    * __queue-limit `<value>`__: Define el límite de paquetes en la cola de salida.
    * __queue-type `<type>`__: Establece el tipo de cola (FIFO, PQ).
4. router(config)# __(Configuración de Control de Congestión)__
    * __random-detect__: Habilita la detección aleatoria de congestión para el manejo de colas y tráfico.
    * __wred `<min-threshold>` `<max-threshold>`__: Establece los umbrales de WRED (Weighted Random Early Detection).

## Implementacion

La implementación de QoS debe adaptarse a los requisitos de la aplicación y características del entorno de red:

### Contextos de Implementación

1. **VoIP en empresas**: Priorizar tráfico de voz (DSCP EF) sobre datos. Se configura `priority percent` en clases de voz para garantizar ancho de banda y latencia mínima. Considerar `mls qos trust dscp` en switches.

2. **Videoconferencia (TelePresence)**: Requiere tratamiento especial para video (DSCP AF41). Se configuran colas separadas para audio (EF), video (AF41) y datos (BE) con garantías de ancho de banda mutuo.

3. **Entorno de sucursal con enlace WAN limitado**: QoS más restrictivo. Se implementa política de "scavenger" para tráfico de baja prioridad y rate-limiting en clases no críticas.

4. **Data center con virtualización**: QoS a nivel de VM usando `qos-group` y marcas internas. Se prioriza tráfico de storage (FCoE), vm-movement y gestión.

5. **Consideraciones de hardware**:
   - Switches: verificar `show mls qos` y buffers de cola
   - Routers: validar queues configuradas con `show queueing`
   - Interfaces: algunos modelos no soportan `priority` en TX ring

6. **Troubleshooting común**:
   - Clases que no coinciden: verificar `show policy-map interface`
   - Contraste de marcas: usar `show mls qos interface` en Catalyst
   - Queue drops: revisar `show policy-map interface` para packet drops

```sh
! 1. Clasificacion del trafico
class-map match-all VOZ
 match ip dscp ef
!
! 2. Definicion de la politica
policy-map PRIORIDAD_VOZ
 class VOZ
   priority 1000  ! Reserva 1000 Kbps con baja latencia
  class class-default
   fair-queue     ! Distribucion equitativa para el resto
!
! 3. Aplicacion a la interfaz de salida
interface GigabitEthernet0/1
 description WAN_OUTBOUND
 service-policy output PRIORIDAD_VOZ
```

[volver](../readme.md)