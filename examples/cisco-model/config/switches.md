# SWITCHES

Configuracion general de los Switches de las instalaciones

## CONFIGURACION GENERAL

```sh
enable
configure terminal
vtp mode client
ip default-gateway 10.0.0.254/24
!
interface range Fa0/1-8
switchport access vlan 10
description ADMINISTRACION
!
interface range Fa0/9-16
switchport access vlan 11
description VENTAS
!
interface range Fa0/17-24
switchport access vlan 12
description INVITADOS
!
interface range Gi0/1-2
switchport mode trunk
ip arp-inspection trust
!
interface range Fa0/1-24
switchport mode access
switchport port-security mac-address sticky
switchport port-security maximum 4
switchport port-security aging time 3600
switchport port-security violation shutdown
switchport port-security
spanning-tree portfast
!
spanning-tree mode rapid-pvst
spanning-tree vlan 1-1005 priority 32768
spanning-tree portfast bpduguard
!
ip dhcp snooping
ip dhcp snooping vlan 10-12
ip arp inspection vlan 10-12
```

## SW-PISO-01

```sh
enable
configure terminal
hostname SW-PISO-01
!
interface vlan 10
ip addres 10.0.0.1 255.255.255.0
no shutdown
!
```
## SW-PISO-02

```sh
enable
configure terminal
hostname SW-PISO-02
!
interface vlan 10
ip addres 10.0.0.2 255.255.255.0
no shutdown
!
```
## SW-PISO-03

```sh
enable
configure terminal
hostname SW-PISO-03
!
interface vlan 10
ip addres 10.0.0.3 255.255.255.0
no shutdown
!
```
## SW-PISO-04

```sh
enable
configure terminal
hostname SW-PISO-04
!
interface vlan 10
ip addres 10.0.0.4 255.255.255.0
no shutdown
!
```

[VOLVER](../config.md)