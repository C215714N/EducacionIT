# Ejemplo Python
class UserData:
    # Metodo Constructor
    def __init__(self, address, cuil, phone, zipcode):
        self.address = address
        self.cuil = cuil
        self.phone = phone
        self.zipCode = zipcode
    # Getters: Obtener Valores
    def get_address(self):
        return self.address

    def get_phone(self):
        return self.phone
    # Setters: Definir Valores
    def set_address(self, address):
        self.address = address

    def set_phone(self, phone):
        return self.phone = phone