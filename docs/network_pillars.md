# Pilares de Red

Constituyen la base conceptual teorica sobre la que se diseña, audita y defiende cualquier infraestructura de ciberseguridad moderna.

## Teoria del control de acceso

Es el conjunto de mecanismos que dictan __quien__ puede hacer __que__ sobre un recurso determinado. Su objetivo principal es garantizar que unicamente los sujetos autorizados puedan interactuar con los objetos protegidos, salvaguardando la confidencialidad y la integridad. Se rige estrictamente por el ciclo __AAA__:

1. _Identificacion:_ El usuario dice quien es (ej. escribir un nombre de usuario).
2. _Autenticacion:_ El sistema verifica que esa identidad sea real (ej. pedir la contraseña o huella).
3. _Autorizacion:_ El sistema evalua que permisos tiene esa identidad sobre el recurso solicitado.
4. _Auditoria (Accounting):_ Registro inmutable de lo que el usuario hizo mientras estuvo dentro.

* _Modelos clasicos:_ __DAC__ (Control Discrecional, el dueño del archivo decide quien entra), __MAC__ (Control Mandatorio, regido por etiquetas rigidas de seguridad militar) y __RBAC__ (Basado en Roles, el estandar corporativo donde los permisos se asignan al puesto de trabajo, no a la persona).

Al ingresar a tu cuenta bancaria digital, colocas tu DNI (_identificacion_) y tu biometria facial (_autenticacion_). El sistema te abre tu panel y te deja ver tu saldo (_autorizacion_), pero si intentas escribir en la barra del navegador la URL del panel del administrador del banco, el servidor te rechaza con un error `403 Forbidden`.

## Teoria del riesgo

Es el marco matematico y estrategico que evalua la probabilidad de que una amenaza aproveche una debilidad del sistema para ocasionar un daño. En ciberseguridad se parte de un postulado absoluto: __el riesgo cero no existe__, el riesgo unicamente se gestiona. Su expresion formal basica en el analisis clasico se calcula mediante la relacion: $\text{Riesgo}=\text{Amenaza}\times\text{Vulnerabilidad}\times\text{Impacto}$

* __Activo:__ Lo que tiene valor y queremos proteger (una base de datos, la reputacion, un servidor).
* __Vulnerabilidad:__ La grieta, error de codigo o debilidad intrinseca del sistema.
* __Amenaza:__ El actor o fenomeno externo/interno capaz de gatillar la vulnerabilidad.
* _Tratamiento del riesgo:_ Ante un riesgo calculado, una organizacion solo tiene cuatro caminos: __Mitigarlo__ (instalar parches), __Transferirlo__ (contratar un seguro contra ciberataques), __Aceptarlo__ (asumir el coste si ocurre porque arreglarlo es mas caro que el daño) o __Evitarlo__ (apagar el servicio problematico).

Una clinica medica tiene una base de datos con historiales de pacientes (_Activo_). El servidor donde se aloja corre sobre Windows Server 2012 sin soporte (_Vulnerabilidad_). En internet operan bandas de _Ransomware_ escaneando puertos buscando ese sistema operativo exacto (_Amenaza_). El calculo de probabilidad de secuestro multiplicado por la quiebra legal de la clinica da como resultado un __Riesgo Critico__.

## Arquitectura en capas

Es un patron de diseño logico y fisico que organiza una red o un software en __niveles jerarquicos apilados__. El principio rector es el desacoplamiento: una capa determinada cumple una funcion estricta y solo se comunica de forma estandarizada con la capa inmediatamente superior e inferior.

* __Aislamiento de fallos:__ Si una capa colapsa o es comprometida, no arrastra automaticamente a todo el sistema.
* __Abstraccion:__ El programador web no necesita saber como la tarjeta de red transforma los datos en pulsos electricos para que su pagina funcione.
* _Referencia universal:_ El __Modelo OSI__ (7 capas) o __TCP/IP__ (4 capas) en telecomunicaciones; o la arquitectura clasica de desarrollo de 3 capas _(Front-end / Logica de negocio / Back-end)_.

Una tienda de comercio electronico:
1. __Capa de Presentacion (Web):__ El navegador del cliente interactua con un servidor _Nginx_ publico.
2. __Capa de Aplicacion (Logica):__ Un servidor interno que calcula precios y stock. Solo acepta peticiones de la Capa 1.
3. __Capa de Datos (Base de datos):__ Un servidor _PostgreSQL_ que guarda las tarjetas de credito. Esta oculto; __jamas__ tiene salida a internet y solo acepta peticiones entrantes de la Capa 2.

## Principio de minima exposicion

Dicta que un sistema, red o dispositivo debe ofrecer al exterior __la menor superficie de ataque posible__. Todo puerto, servicio, protocolo, cuenta de usuario o banner informativo que no sea estrictamente imprescindible para el funcionamiento del negocio debe ser eliminado, cerrado u ocultado.

* Trabaja en conjunto con la tecnica de __Hardening__ (bastionado de sistemas).
* Reduce la fase de _Reconocimiento Pasivo_ de los atacantes (evita que un escaner como Shodan sepa exactamente que software ejecutas).
* No debe confundirse con la _"Seguridad por oscuridad"_ (ocultar algo inseguro esperando que nadie lo vea); la minima exposicion consiste en __no tener nada expuesto que se pueda atacar__.

Configurar una base de datos recien instalada en un servidor Linux:
* _Exposicion negligente:_ Dejar abiertos los puertos 22 (SSH), 80 (HTTP) y 3306 (MySQL) orientados a todo internet, permitiendo ademas que el software responda al escaneo: `MySQL 5.7.33 - Ubuntu Linux`.
* _Minima exposicion:_ El puerto 3306 se configura para escuchar estrictamente en `localhost` (solo la propia maquina puede hablarle); el puerto 22 se cierra al publico y solo responde si la IP entrante viene autenticada a traves de la VPN corporativa.

## Defensa en profundidad _(Defense in Depth)_

Inspirado en tacticas militares de contencion, es un modelo que asume el paradigma contemporaneo de __"Brecha Asumida"__ (_Assume Breach_): _algun control va a fallar_. Por ende, consiste en diseñar multiples barreras de seguridad superpuestas para que, cuando un atacante logre saltar la primera, se estrelle inmediatamente contra la segunda.

* Obliga a combinar controles __Tecnicos__ (firewalls), __Administrativos__ (politicas de empresa) y __Fisicos__ (camaras, torniquetes).
* Cubre las tres fases del tiempo de un ataque: __Prevencion, Deteccion y Respuesta__.
* __Exige diversidad:__ Si colocas tres firewalls en fila pero los tres son de la marca _Fortinet_, una sola vulnerabilidad de "Dia Cero" en ese software perforara las tres capas a la vez. Las capas deben ser heterogeneas.

Proteger un archivo Excel con los balances secretos de la empresa:
1. _Perimetro:_ Un Firewall filtra descargas maliciosas en el router de la oficina.
2. _Red:_ Una VLAN segmentada impide que la red de invitados escanee la red de Finanzas.
3. _Endpoint:_ Un agente __EDR__ analiza en tiempo real la memoria de la laptop del contador.
4. _Identidad:_ El contador requiere Doble Factor (MFA) para abrir su sesion de Windows.
5. _Aplicacion:_ El archivo `.xlsx` requiere una contraseña AES-256 para abrirse.
6. _Dato:_ El disco duro de la laptop esta cifrado por hardware con BitLocker.

(Si el contador cae en un Phishing y el atacante salta el Firewall, __el EDR frena el script__; si el EDR falla, el atacante no puede abrir el Excel por la contraseña; si se roban la laptop fisica en la calle, el _disco duro es ilegible_).

[volver](../readme.md)