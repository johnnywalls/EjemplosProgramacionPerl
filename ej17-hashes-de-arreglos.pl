#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

use Data::Dumper;
# de nuevo, utilizar referencias para construir las estructuras de datos

my $ingredientes = {
  'Tarta' => [ 'Harina de Trigo', 'Huevos', 'Mantequilla' ],
  'Tortilla' => [ qw/ Patatas Huevo Jamón Guisantes Bacon / ],
};

say Dumper $ingredientes;

# De nuevo, tener en cuenta las referencias y el contexto!
say "Tenemos " . keys( %$ingredientes ) . " recetas";
foreach my $receta ( sort keys %$ingredientes ) {
  say "=" x 10 . $receta . "=" x 10;
  my $n;
  foreach ( @{ $ingredientes->{$receta} } ) {
    say ++$n . "- $_";
  }
}