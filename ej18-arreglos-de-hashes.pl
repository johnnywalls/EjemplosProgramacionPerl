#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

use Data::Dumper;

# usar referencias para construir estructuras complejas...
# ya sabemos por dónde va esto, ¿no?
my $personajes = [
  { nombre => 'Bart',   apellido => 'Simpson',  edad => 12 },
  { nombre => 'Lisa',   apellido => 'Simpson',  edad => 10 },
  { nombre => 'Marge',  apellido => 'Simpson',  edad => 38 },
  { nombre => 'Homero', apellido => 'Simpson',  edad => 40 },
  { nombre => 'Ned',    apellido => 'Flanders', edad => 39 },
  { nombre => 'Seymour',apellido => 'Skinner', },
];
say Dumper $personajes;

say "Tenemos " . scalar(@$personajes) . ' personajes';

# Calcular la edad promedio
my @edades = map $_->{ edad }, grep( exists $_->{ edad }, @$personajes);
say Dumper \@edades;

# de manera alternativa, podriamos haber hecho
my @edades_v2;
foreach (@$personajes) {
  push @edades_v2, $_->{edad} if exists $_->{edad};
}
say Dumper \@edades_v2;

use Math::NumberCruncher;
say "La edad promedio es " . sprintf( '%.2f', Math::NumberCruncher::Mean(\@edades) );
