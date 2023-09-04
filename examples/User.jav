class User{
    // Properties
    private int id;
    private String name;
    private String username;
    private String email;
    private Address address;
    private String phone;
    private String website;
    private Company company;

    // Constructor
    public void User(name, username, email, phone, website){
        this.name = name;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.website = website;
        return ok();
    }
    // Private Methods
    private void ok(){
        return "datos cargados correctamente";
    }
    private void no(format){
        return "debe respetar el formato ingresando " + format;
    }
    // Public Methods
    setAddress(params){
        (params == null) ? 
            return no("algun valor") :
        (params.length < 4) ?
            return no("calle, localidad, cuidad y codigo postal") :
            this.address = new Address(params);
            return ok();
    }
    setCompany (params){
        (params === null || params.length < 3) ?
        return no("ingresando nombre, slogan y rubro") :
        return ok()
    }
}

class Addresss{
    // Properties
    private String street;
    private String suite;
    private String city;
    private String zipcode;
    private Geo geo;

    public void Address(street, suite, city, zipcode){
        this.street = street;
        this.suite = suite;
        this.city = city;
        this.zipcode = zipcode;
    }
    public void setGeo(lat, lng){
        this.geo = new Geo(lat, lng);
    }
    public get(data){
        return this[data];
    }
    public set(key, value){
        return this[key] = value;
    }
    getUsername(){
        return this.username;
    }
    setUsername(name){
        if name.length >= x ?
        this.username = name :
        return no("nombre de usuario con al menos x caracteres")
    }
}

class Geo{
    // Properties
    private String lat;
    private String lng;
}
class Company{
    // Properties
    private String name;
    private String catchPhrase;
    private String bs;
}

// Instancias de las clases
user = new User('cristian', "c215714n", "cristiandracedo@hotmail.com", "5411-0303-4567", "misitio.com");

user.address.set("zipcode", "1856");