# ROUTERS

Configuracion general de los routers de las instalaciones

## CONFIGURACION GENERAL

```sh
enable
configure terminal
ip route 10.0.0.0 255.255.0.0 10.0.0.253
ip route 10.0.0.0 255.255.0.0 10.0.0.252
ip route 0.0.0.0 0.0.0.0 191.186.25.1
```

## R-EDIFICIO-01

```sh
enable
configure terminal
interface po1
ip address 10.0.0.240 255.255.255.0
interface range Gi0/0-2
channel-group 1
```

## R-EDIFICIO-02

```sh
enable
configure terminal
interface po1
ip address 10.0.0.241 255.255.255.0
```