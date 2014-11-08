#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

use Data::Dumper;

# no funciona como arreglo multidimensional, se 'aplana'
my @a = ( (1,2,3), (4,5,6) );
say Dumper \@a;

# si cada elemento del arreglo es un referencia, podemos
# declarar estructuras mas complejas de datos
my @b = ( [1,2,3], [4,5,6] );
say Dumper \@b;

# Muchas veces preferimos usar siempre referencias
my $arr1 = [ [1,2,3], [4,5,6] ];
say Dumper $arr1;

# los arreglos no tienen que tener las mismas dimensiones
# ni alojar valores del mismo tipo

my $arr2 = [ [1,2,'tres'], [5, undef] ];
say Dumper $arr2;

my $tres_en_raya = [
  ['X', 'O', 'O'],
  ['O', 'O', 'X'],
  ['O', 'X', 'X'],
];

my $diagonal1 = [ $tres_en_raya->[0]->[0], $tres_en_raya->[1]->[1], $tres_en_raya->[2]->[2] ];
say "@$diagonal1";

# no es necesario hacer la doble 'desreferencia' en Perl:
my $diagonal2 = [ $tres_en_raya->[2][0], $tres_en_raya->[1][1], $tres_en_raya->[0][2] ];
say "@$diagonal2";

say "Escribe varias líneas:";
# Podemos construir arreglos multidimensionales procesando datos
# solo debemos recordar utilizar los contextos adecuados
my $lineas;
while (<STDIN>) {
  chomp;
  my @palabras = split;
  push @$lineas, [ @palabras ];
}
say Dumper $lineas;

