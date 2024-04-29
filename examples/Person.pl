package Persona;
# Constructor
sub new {
    my $class = shift;
    my ($nombre, $apellido, $edad) = @_;
    my $self = {
        nombre => $nombre,
        apellido => $apellido,
        edad => $edad
    };
    bless $self, $class;
    return $self;
}
## Getters
sub get_nombre_completo {
    my ($self) = @_;
    return "$self->{nombre} $self->{apellido}";
}
sub get_edad {
    my ($self) = @_;
    return $self->{edad};
}
## Setters
sub set_nombre_completo {
    my ($self, $nombre, $apellido) = @_;
    $self->{nombre} = $nombre if length($nombre) >= 3;
    $self->{apellido} = $apellido if length($apellido) >= 3;
}
sub set_edad {
    my ($self, $edad) = @_;
    $self->{edad} = $edad if $edad >= 0 && $edad <= 125;
}
# Instancia
my $usuario = Persona->new("Cristian", "Racedo", 25);
print $usuario->get_edad(), "\n"; # 25
$usuario->set_edad(33);
print $usuario->get_edad(), "\n"; # 33
