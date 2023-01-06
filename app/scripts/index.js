class UserData{
    id = 0;
    name = '';
    username = '';
    email = '';
    address = new Address;
    phone = '';
    website = '';
    company = new Company;
}

class Address{
    street = '';
    suite = '';
    city = ''
    zipcode = 0;
    geo = new GeoLocation;
}

class GeoLocation{
    lat = 0;
    lng = 0;
}

class Company{
    name = '';
    catchPhrase = '';
    bs = '';
}