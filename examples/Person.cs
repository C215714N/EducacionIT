class Person{
    // Propiedades Privadas
    private string name
    private int age
    // Metodos Publicos
    // constructor
    public Person(string name, int age){
        this.name = name;
        this.age = age;
    }
    // Getters
    public string getName(){
        return name;
    }
    public int getAge(){
        return age;
    }
    // Setters
    public void setName(name){
        this.name = name;
    }
    public void setAge(age){
        this.age = age;
    }
}
// Instancia
const user = new Person("cristian",18)
user.setAge(33)