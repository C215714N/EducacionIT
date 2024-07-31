class Person {
private: // Propiedades Privadas
    string name;
    int age;
public: // Metodos Publicos
    // Constructor
    Person(string name, int age){
        this->name = nombre;
        this->age = apellido;
    }
    // Getters
    string getName() {
        return name;
    }
    int getAge() {
        return age;
    }
    // Setters
    void setName(string name) {
        this->name = name;
    }
    void setAge(int age) {
        this->age = age;
    }
};
// Instancia
Person user("cristian", 18);
user.setAge(33);