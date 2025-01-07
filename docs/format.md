JSON: JavaScript object notation (pares de clave valor)
```json
{
	"ietf-interface:ipv4" : {
		"name": "gigabitethernet",
		"description": "red local",
		"ietf-ipv4:address": {
			"address": "192.168.0.10",
			"subnet-mask": "255.255.255.0"
		}
	}
}
```

YAML: Evolucion de JSON que no utiliza llaves
```yaml
ietf-interface:ipv4 :
	name: "gigabitethernet",
	description: "red local",
	ietf-ipv4:address:
		address: "192.168.0.10",
		subnet-mask: "255.255.255.0"
```

XML Extensible Markup Language ()
```xml
<ietf-interface:ipv4>
	<name>gigabitethernet</name>
	<description>red local</description>
	<ietf-ipv4:address>
		<address>192.168.0.10</address>
		<subnet-mask>255.255.255.0</subnet-mask>
	</ietf-ipv4:address>
</ietf-interface:ipv4>
```