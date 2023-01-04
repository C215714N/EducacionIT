//  Clase Abstracta (Superclase)
    class Person{
        name;
        lastName;
        age;
        setFullName(name, lastName){
            this.name = name;
            this.lastName = lastName;
        }
    }
//  Subclase
    class Employee extends Person{
        sucursal;
        salary;
        inDate;
        setSalary(amount = 0){
            this.salary = amount;
        }
        setSalary(amount = 0, percentage = 1){
            this.salary = amount * percentage;
        }
    }
//  Clase Concreta (Objetos)
    class Officer extends Employee {
        clients = [1, 50, 30, 20]
    }
// Objeto
    const cristian = new Officer();