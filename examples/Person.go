package main
import (
    "fmt"
)
// Propiedades
type Persona struct {
    nombre   string
    apellido string
    edad     int
}
// Constructor
func Persona(nombre, apellido string, edad int) *Persona {
    return &Persona{nombre, apellido, edad}
}
// Getters
func (p *Persona) NombreCompleto() string {
    return p.nombre + " " + p.apellido
}
func (p *Persona) Edad() int {
    return p.edad
}
// Setters
func (p *Persona) SetNombreCompleto(nombre, apellido string) {
    if len(nombre) >= 3 {
        p.nombre = nombre
    }
    if len(apellido) >= 3 {
        p.apellido = apellido
    }
}
func (p *Persona) SetEdad(edad int) {
    if edad >= 0 && edad <= 125 {
        p.edad = edad
    }
}
// Instancia
usuario := Persona("Cristian", "Racedo", 25)
fmt.Println(usuario.Edad()) // 25
usuario.SetEdad(33)
fmt.Println(usuario.Edad()) // 33