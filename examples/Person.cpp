#include <iostream>
#include <string>
using namespace std;

class Persona {
// Propiedades
private:
    string nombre;
    string apellido;
    int edad;
// Metodos
public:
    // Constructor
    Persona(string nombre, string apellido, int edad) {
        this->nombre = nombre;
        this->apellido = apellido;
        this->edad = edad;
    }
    // Getters
    string getNombreCompleto() {
        return nombre + " " + apellido;
    }
    int getEdad() {
        return edad;
    }
    // Setters
    void setNombreCompleto(string nombre, string apellido) {
        if (nombre.length() >= 3) this->nombre = nombre;
        if (apellido.length() >= 3) this->apellido = apellido;
    }
    void setEdad(int edad) {
        if (edad >= 0 && edad <= 125) this->edad = edad;
    }
};
// Instancia
int main() {
    Persona usuario("Cristian", "Racedo", 25);
    cout << usuario.getEdad() << endl; // 25
    usuario.setEdad(33);
    cout << usuario.getEdad() << endl; // 33
}