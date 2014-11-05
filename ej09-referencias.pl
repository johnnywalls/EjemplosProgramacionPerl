#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

# Podemos tener referencias a variables escalares
my $nombre = 'Paco';
my $refnombre = \$nombre;

# y asi pasar argumentos por referencia a subrutinas,
# que pueden tener acceso eficiente a los datos, y modificarlos
sub saludo {
  my $persona = shift;
  say "Hola " . $$persona; # o ${ $persona }
  ${ $persona } .= ' Valleverde';
}

saludo $refnombre;
say $nombre;

# Referencias a arreglos
my @dado = ( 1..6 );
my $refdado = \@dado;
say $refdado->[-1]; #6
say reverse @$refdado;

# al pasar referencias, evitamos la copia innecesaria (expansion)
# de listas
sub lanzar_dado {
  my $d = shift;
  state $n;
  $n++;
  say "Lanzamiento $n: " . $d->[ int( rand( scalar @$d ) ) ];
}

foreach ( 1..3 ) {
  lanzar_dado $refdado;
}

# referencia a lista anonima
my $menu = [ 'Sopa', 'Pollo', 'Vegetales', 'Carne' ];
say "Tenemos @$menu";
push @{ $menu }, 'Pescado';
say "Ahora hay " . scalar @$menu . " opciones: @$menu";

# Tambien podemos tener referencias a un hash:
my %precios = ( 'Sopa' => 5, 'Pollo' => 6.25, 'Vegetales' => 4.5 );
my $rprecios = \%precios;
mostrar_menu( $rprecios );

$rprecios->{ Carne } = $rprecios->{ Pollo } * 1.3;
mostrar_menu( $rprecios );

sub mostrar_menu {
  my $m = shift;
  say '=' x 30;
  foreach ( sort keys %$m ) {
    say "Menu: $_ \tPrecio: $m->{$_}";
  }
}

# referencias a hash anonimos
my $datos = {
  nombre => 'Lisa',
  apellido => 'Simpson',
  hobby => 'tocar saxofon',
};
say "A $datos->{nombre} le gusta $datos->{hobby}" if exists $datos->{hobby};
say "Sus datos son: " . join( ',', values %$datos );

# Referencias a subrutinas
my $sonido = sub {
  say 'meow!';
};
my $animal = sub {
  say 'Gato';
};

say "Animal";
$animal->();
say "Sonido";
$sonido->();

# Otro ejemplo
sub ruge {
  say "Grrrroarrr!!!";
}
sub maulla {
  say "miau...";
}
sub ladra {
  say "Woof!!!";
}

my $perro = { nombre => 'Lassie', sonido => \&ladra };
my $gato  = { nombre => 'Felix',  sonido => \&maulla };
my $leon  = { nombre => 'Simba',  sonido => \&ruge };

say "$perro->{nombre} dice "; $perro->{sonido}->();
say "$gato->{nombre} dice "; $gato->{sonido}->();
say "$leon->{nombre} dice "; $leon->{sonido}->();

say "Todos juntos!!!";
my $animales = [ $perro, $gato, $leon ];
for (@$animales) {
  $_->{sonido}->();
}

