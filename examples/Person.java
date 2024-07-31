class Person{
    // Propiedades Privadas
    private String name
    private int age
    // Metodos Publicos
    // constructor
    public Person(String name, int age){
        this.name = name;
        this.age = age;
    }
    // Getters
    public String getName(){
        return this.name;
    }
    public int getAge(){
        return this.age;
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
Person user = new Person("cristian",18)
user.setAge(33)