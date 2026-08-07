# MULTILAYER

## Configuracion General 

```sh
enable
vlan database 
vlan 10 name ADMINISTRACION
vlan 11 name COMUNICACION
vlan 12 name VENTAS
vlan 13 name INVITADOS
exit
configure terminal
!
interface vlan 10
no shutdown
interface vlan 11
no shutdown
interface vlan 12
no shutdown
interfaec vlan 13
no shutdown
!
interface range Gi1/1/1-4
channel-group 1 mode on
interface range Gi1/0/21-24
channel-group 2 mode on
interface range Gi1/0/17-20
channel-group 3 mode on
interface range Gi1/0/13-16
channel-group 4 mode on
!
interface range Gi1/0/13-24, Gi1/1/1-4
switchport mode trunk
switchport trunk allowed vlan 1,10-12
!
spanning-tree mode rapid-pvst
```

## ML-PISO-01
```sh
enable
configure terminal
hostname ML-PISO-01
!
interface range Gi1/0/1-3
channel-group 5 mode on
switchport access vlan 10
!
interface vlan 10
ip address 10.0.0.253 255.255.255.0
!
spanning-tree vlan 10,12 priority 20480
spanning-tree vlan 11,13 priority 24576
```
## ML-PISO-02
```sh
enable
configure terminal
hostname ML-PISO-02
!
interface range Gi1/0/1-3
channel-group 5 mode on
switchport access vlan 10
!
interface vlan 10
ip address 10.0.0.252 255.255.255.0
!
spanning-tree vlan 10,12 priority 24576
spanning-tree vlan 11,13 priority 20480
```
## ML-PISO-03

## ML-PISO-04