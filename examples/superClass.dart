// Superclase
class Person {
    String firstName;
    String lastName;
    Date birthDate;
    String idType;
    String idNumber;
}
// Subclase
class Employee extends Person {
    Float salary;
    String rol;
    Array workload;
    requestVacation(startDate, endDate)
}
// Clase Hija
class Manager extends Employee {
    Array employees;
    promoteEmploye(employee, rol)
}
class Professional extends Person {
    String degree;

}
class Student extends Person {
    String carrer;
    Array schedule;
}


