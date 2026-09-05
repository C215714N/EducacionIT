# Seguridad en Redes

La seguridad en redes no se limita a colocar dispositivos como firewalls, sino que es una disciplina técnica y estratégica para proteger la infraestructura frente a amenazas internas y externas. Cada intercambio de datos implica una exposición. La seguridad regula la accesibilidad definiendo __qué está permitido, cuándo y con qué control__.

## Pilares y Fundamentos

* __Defensa en profundidad:__ Ningún control individual alcanza. La seguridad se distribuye en capas (*perímetro, red interna, aplicación y usuario*) para que, si una falla, otra contenga el impacto.
* __Tres dimensiones interrelacionadas:__
    1. __Física:__ Protección de centros de datos, cableado y hardware.
    2. __Lógica:__ Protocolos, cifrado, direccionamiento IP y __segmentación estructural__ (clave para evitar la propagación lateral de ataques).
    3. __Administrativa:__ Políticas de seguridad, auditorías y gestión de incidentes.

* __Alcance moderno:__ El error conceptual más común es creer que el perímetro físico define la red. Hoy el perímetro es __dinámico y distribuido__ (incluye servicios en la nube, accesos remotos y conexiones de terceros).

## Modelo OSI

Sirve como lenguaje común para mapear en qué nivel ocurre un ataque y cómo defenderlo. Las tres capas que concentran la mayor superficie de ataque moderna son:

* __Capa 3 (Red):__ Atacada mediante *IP spoofing* o manipulación de ruteo. Se defiende con listas de control de acceso (ACLs) y segmentación.
* __Capa 4 (Transporte):__ Atacada mediante escaneo de puertos o *SYN floods*. Se defiende con Firewalls L4 y cierre de puertos innecesarios.
* __Capa 7 (Aplicación):__ La más compleja (ataques de *SQL Injection, XSS, abuso de APIs*). Se defiende con sanitización de entradas, autenticación robusta y WAF (*Web Application Firewall*).

## La Tríada CID

La seguridad busca equilibrar tres principios básicos:

* __Confidencialidad:__ Garantizar que solo accedan autorizados (mediante cifrado y segmentación).
* __Integridad:__ Evitar modificaciones indebidas (mediante firmas digitales y hashes).
* __Disponibilidad:__ Mantener los servicios operativos (mediante redundancia y mitigación anti-DDoS).

## Gestión del Riesgo

El riesgo se calcula bajo la siguiente fórmula: $$\text{Riesgo} = \text{Probabilidad} \times \text{Impacto}$$

* __Proceso sistemático:__ Identificación de activos $\rightarrow$ Identificación de amenazas $\rightarrow$ Detección de vulnerabilidades $\rightarrow$ Evaluación de impacto $\rightarrow$ Implementación de controles (*preventivos, detectivos o correctivos*).
* __Meta realista:__ No se busca eliminar el riesgo por completo (riesgo inherente), sino reducirlo mediante controles hasta un __riesgo residual aceptable__.

## Riesgos de Host y Superficie de Ataque

* La red es tan fuerte como su eslabón más débil. Un endpoint o servidor mal configurado compromete todo el entorno.
* __Factores críticos de riesgo en hosts:__ Falta de actualizaciones (parches), servicios y puertos innecesarios activos, configuraciones por defecto (credenciales de fábrica) y privilegios excesivos en cuentas de usuario.

## Topología, Segmentación y Flujos de Tráfico

* __El peligro de las redes planas:__ Si todos los equipos comparten un mismo segmento, un atacante que logra ingresar puede realizar __movimiento lateral__ en segundos.
* __Estrategia de contención:__ Uso obligatorio de __VLANs, DMZ__ (para aislar servicios expuestos a Internet), __microsegmentación__ y separación de redes por niveles de confianza.
* __Análisis de flujos:__
    * __Tráfico Norte-Sur:__ Comunicación entre la red interna e Internet. Históricamente fue el único foco de los firewalls perimetrales.
    * __Tráfico Este-Oeste:__ Comunicación interna entre equipos de la misma red. Es el flujo más crítico hoy en día, ya que es el que utilizan los atacantes para expandirse internamente; por ello, requiere adoptar un enfoque __Zero Trust__ (*nunca confiar, siempre verificar*).