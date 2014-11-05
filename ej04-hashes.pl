#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

use Data::Dumper;

# Declaracion.  Note que las llaves pueden especificarse entre comillas o no
my %apellidos = ( 'pedro' => 'picapiedra', pablo => 'marmol' );
$apellidos{ vilma } = 'picapiedra';
say "Hola, pedro. Tu apellido es $apellidos{pedro}";

say Dumper \%apellidos; # esto es una referencia, lo trataremos en detalle luego.
                        # por ahora, lo usamos para que Dumper muestre la estructura
                        # con un mejor formato

# Una llave puede ser cualquier expresion escalar
my $x = 'no';
$apellidos{ 'di' . $x } = 'picapiedra';

# podemos extraer las claves o los valores de un hash en arreglos:
say "Nombres:";
say Dumper( keys %apellidos );
say "Apellidos:";
say Dumper( values %apellidos );

# o recorrer con un ciclo
say "Recorrer con foreach";
foreach my $nombre ( keys %apellidos ) {
  say "Nombre: $nombre \t Apellido: $apellidos{$nombre}";
}

# o incluso darle nombre a claves y valores
say "Recorrer con while/each";
while ( my ( $nombre, $apellido ) = each %apellidos ) {
  say "Nombre: $nombre \t Apellido: $apellido";
}

# si intentamos obtener el valor de una clave inexistente... undef
say "Hola, larry " . $apellidos{ larry };

# Podemos probar si una clave existe en el hash:
say "Hola, larry " . $apellidos{ larry } if exists $apellidos{ larry };

say "Lo sentimos, larry, no te encontramos" unless exists $apellidos{ larry };

# De nuevo, los elementos de un hash no estan ordenados. Podemos convertir
# un hash a una lista y viceversa, pero no podemos garantizar mantener el orden
my @lista = %apellidos;
say Dumper @lista;
my %otro_hash = @lista;
say Dumper \%otro_hash;

# Con esta tecnica, podemos "invertir" un hash: convertir las claves en valores
# y viceversa.
my %datos = ( 'nombre' => 'pedro', 'apellido' => 'picapiedra' );
my %datos_invertidos = reverse %datos;
say Dumper \%datos_invertidos;

# pero cuidado, las claves son unicas en un hash:
# al tener valores repetidos e "invertir", perderemos datos
my %nombres = reverse %apellidos;
say Dumper \%nombres;

# podemos eliminar una clave de un hash
say "adios dino!!!";
delete $apellidos{dino};
say Dumper \%apellidos;

# Podemos examinar nuestro entorno de ejecución (variables de entorno)
# con el hash especial %ENV:
say "Mi directorio personal es $ENV{HOME}";
say Dumper \%ENV;
