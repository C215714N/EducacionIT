## OpenSSL 

Biblioteca de código abierto que ofrece _herramientas y recursos_ para la __implementación de protocolos de seguridad criptográfica__. 

Desarrollada inicialmente para soportar __protocolos de seguridad SSL (Secure Sockets Layer)__, pero ha evolucionado para ser __compatible con TLS (Transport Layer Security)__, una versión más segura y moderna del protocolo. 

Es ampliamente utilizada para asegurar comunicaciones a través de redes, como internet, _mediante el cifrado de datos y la autenticación de usuarios_; está escrita en C y es multiplataforma.

### Características

* __Cifrado__: Soporta una amplia variedad de algoritmos de _cifrado simétrico (como AES, DES) y asimétrico (como RSA, DSA, ECDSA)_.
* __Certificados__: Permite crear, firmar, y gestionar certificados X.509, que son fundamentales para la _autenticación en redes seguras_.
* __SSL/TLS__: Implementa versiones actualizadas de los protocolos, permitiendo la creación de canales de comunicación seguros.
* __Herramienta CLI__: Potente herramienta de línea de comandos que facilita el uso de sus funcionalidades.
* __Bibliotecas__: Ofrece funcionalidades de seguridad que los desarrolladores pueden integrar en aplicaciones.

### Implementacion

* __Seguridad__: Fundamental para configurar servidores web HTTPS, garantizando que las conexiones sean cifradas y seguras.
* __Certificacion__: Permite la creacion de certificados autofirmados o firmados por una autoridad certificadora (CA).
* __Cifrado__: Los archivos pueden ser descifrados solamente por usuarios autorizados, utilizando claves y certificados.
* __Verificacion__: Se utiliza para firmar digitalmente los datos, garantizando su integridad y autenticidad.
* __Conexiones Seguras__: Permite crear túneles seguros entre dos puntos, protegiendo la comunicación en aplicaciones como VPNs.
* __Desarrollo Seguro__: Ampliamente utilizado por desarrolladores para integrar funciones de cifrado, autenticación, y firma digital en sus aplicaciones.

### Configuración

Se puede configurar OpenSSL para aplicaciones específicas, modificando el archivo de configuración `openssl.cnf` que se encuentra en la carpeta de instalación.

* __Windows__: `C:\Program Files\OpenSSL\bin\`
* __Linux__: `/etc/ssl/openssl.cnf` o `/usr/lib/ssl/openssl.cnf`

### Ejemplos

* __[ca]__: Define la configuración por defecto para la autoridad certificadora
   ```ini
   [ ca ]
   default_ca = CA_default
   ```
* __[CA_default]__: Contiene las rutas y configuraciones necesarias para la operación de la CA, como directorios de certificados, bases de datos, archivos de número de serie.
   ```ini
   [ CA_default ]
   dir               = ./demoCA                  # Directorio de la CA
   certs             = $dir/certs                # Certificados emitidos
   new_certs_dir     = $dir/newcerts             # Nuevos certificados
   database          = $dir/index.txt            # Base de datos de la CA
   serial            = $dir/serial               # Archivo de número de serie
   RANDFILE          = $dir/private/.rand        # Archivo de entropía
   private_key       = $dir/private/cakey.pem    # Clave privada de la CA
   certificate       = $dir/cacert.pem           # Certificado de la CA
   default_md        = sha256                    # Algoritmo de digestión predeterminado
   policy            = policy_anything           # Política de emisión
   default_days      = 365                       # Validez predeterminada del certificado
   default_crl_days  = 30                        # Días predeterminados para CRL
   default_bits      = 2048                      # Tamaño de la clave predeterminado
   email_in_dn       = no                        # Incluir email en DN
   name_opt          = ca_default                # Opciones de nombre
   cert_opt          = ca_default                # Opciones de certificado
   copy_extensions   = copy                      # Copiar extensiones del CSR al CRT
   preserve          = no                        # Preservar DN de entrada
   ```
* __[policy_anything]__: Política que define los campos que deben estar presentes o son opcionales en los certificados emitidos.
   ```ini
   [ policy_anything ]
   countryName             = optional
   stateOrProvinceName     = optional
   localityName            = optional
   organizationName        = optional
   organizationalUnitName  = optional
   commonName              = supplied
   emailAddress            = optional
   ```
* __[v3_ca]__: Extensiones utilizadas cuando se genera un certificado.
   ```ini
   [ v3_ca ]
   subjectKeyIdentifier    = hash
   authorityKeyIdentifier  = keyid:always,issuer
   basicConstraints        = critical, CA:true
   keyUsage                = critical, cRLSign, keyCertSign
   ```

### Comandos

Puedes usar OpenSSL para diversas tareas, como generar certificados, claves, y realizar operaciones criptográficas.

* __openssl genpkey -algorithm `RSA` -out `private_key.pem`__: Genera una clave privada
* __openssl `req` -new -key `private_key.pem` -out `request.csr`__: Crear una solicitud de firma de certificado (CSR)
* __openssl `req` -new -x509 -key `private_key.pem` -out `certificate.pem`__: Genera un certificado autofirmado
* __openssl `x509` -in `server.crt` -text -noout__: Verifica el contenido de un certificado