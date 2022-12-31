/**
    Class muy general o abarcativa
    posee conceptos o propiedades vagas del objeto
    no puede ser instanciada
*/
abstract class Person{
    string firstName;
    string lastName;
    date birthDate;

    Person(firstName, lastName, birthDate){
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDate = birthDate;
    }

}
// Extension de la clase persona, en otros lenguajes se utiliza extends
class Employee : Person{
    int employeeId;
    date inDate
    string charge;
}

class Manager: Employee{
    string sucurcal;
    Employee[] employees;
    boolean internal;
}

class Teacher: Employee{
    string courses;
    string turns;
    string specialities;
}

// Conjunto de metodos abstractos que pueden ser manipulados por las subclases
interface User{
    abstract login();
}

class UserNameAccess: User{
    login(){
        if (username == 'pepe'){

        }
    }
}
class UserEmailAccess: User{
    login(){
        if (useremail == 'pepe@gmail.com'){

        }
    }
}