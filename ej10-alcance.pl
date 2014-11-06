#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my $n = 5;
my $m = 15;

say ++$n;

foreach my $n ( 1..5 ) { # variable local al ciclo
  say "Dentro del ciclo: $n";
}

# la variable externa se mantuvo sin modificar
say "Bloque principal: $n";

# Lo mismo en un condicional
if ($n) {
  my $n = 42;
  say "La respuesta a la vida, el universo y todo lo demas... $n";
}

say "Bloque principal: $n";

sub cuadrado {
  my $n = shift; # variable lexica de la subrutina
  $n **= 2; # aqui modificamos solo la variable interna
  # Podemos acceder a variables 'externas' que no hayan sido
  # redefinidas localmente. Sin embargo, en general no es buena practica
  say "Tambien tenemos acceso a la variable \$m: $m";
  return $n;
}

say "El cuadrado de $n es " . cuadrado($n);
say "\$n todavia vale $n";

my $n = 5432; # genera advertencia al redefinir $n