#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

use Data::Dumper;

# foreach y for son intercambiables, Perl los interpreta igual
foreach (1..10) {
  say "$_ * $_ = ", $_ * $_;
}

# incluso podemos colocar el ciclo luego de la instruccion, similar a
# los condicionales
say "$_ * $_ = ", $_ * $_ for 1..10;


# podemos declarar variables para la iteracion
say '== Tablas de Multiplicar ==';
foreach my $base ( 1..10 ) {
  say "Tabla del $base";
  foreach my $mul ( 1..10 ) {
    say "$base * $mul = ", $base * $mul;
  }
  say '-' x 15;
}

# Podemos usar ciclos al estilo C (si de verdad queremos)
for ( my $i=0; $i<=5; $i++ ) {
  say $i;
}

# Podemos modificar los valores del arreglo/lista que recorremos
my @numeros = 1..10;
$_ **= 2 for @numeros; # los elevamos al cuadrado
say "@numeros";

# Tiramos un dado mientras obtengamos resultados menores a 4:
my $dado = 1 + int( rand( 6 ) );
while ($dado < 4) {
  say "Sacamos $dado... Reintentar!";
  $dado = 1 + int( rand( 6 ) );
}
say "Hurra! Sacamos $dado";

# Podemos posponer la condicion al final del ciclo
do {
  $dado = 1 + int( rand( 6 ) );
  if ( $dado < 4 ) {
    say "Sacamos $dado... Reintentar!";
  }
  else {
    say "Hurra! Sacamos $dado";
  }
} while ( $dado < 4 );

# podemos tambien tener ciclos 'infinitos'
while (1) {
  $dado = 1 + int( rand( 6 ) );
  if ( $dado < 4 ) {
    say "Sacamos $dado... Reintentar!";
  }
  else {
    say "Hurra! Sacamos $dado";
    last; # terminamos el ciclo
  }
}

# ciclo obviando los numeros impares, por ejemplo
for (1..10) {
  next unless $_ % 2;
  say; # equivalente a say $_
}

# con 'map' podemos generar una nueva lista
# transformando los elementos de una existente
my @cuadrados = map $_ ** 2, 1..10;
say "@cuadrados";

# lo que es mucho mas compacto (y eficiente) que
@cuadrados = (); #lista vacia
foreach (1..10) {
  push @cuadrados, $_ ** 2;
}
say "@cuadrados";

# Podemos generar tambien estructuras (hashes) con map
my %mas_cuadrados = map { $_ => $_ ** 2 } 1..10;
say Dumper(\%mas_cuadrados);

# Tambien podemos seleccionar un subconjunto de valores
# de un arreglo con grep
my @pares = grep { $_ % 2 == 0 } 1..50;
say "@pares";
