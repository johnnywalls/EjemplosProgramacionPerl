#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

say "Escribe lo que quieras, pulsa Enter";
# Leer desde la entrada estandar
my $linea = <STDIN>; # una linea. Incluye el salto de linea (Enter)
say "$linea es lo que acabas de escribir";
chomp($linea); # eliminar el salto de linea
say "$linea (ahora sin salto de linea)";

# o directamente
say "Prueba de nuevo!";
chomp ( $linea = <STDIN> );
say "$linea es lo que acabas de escribir";

say "Ahora prueba con varias lineas (finaliza con Ctrl+D)";
my $n;
while (defined($linea = <STDIN>)) {
  ++$n;
  print "$n:  $linea";
}

# un estilo muy utilizado en procesamiento de entrada con Perl
# es utilizar las variables predeterminadas, o incluso actuar
# sobre ellas de manera implicita
say "Escribe varias lineas!";
while (<>) { #omitimos STDIN
  chomp; # equivalente a chomp $_
  my $invertido = reverse; # igual, actua como reverse $_
  say "al reves: $invertido";
}

# Tambien podemos utilizar el operador de entrada en contexto
# de lista, para leer todas las lineas
say "Si, escribe de nuevo, ya casi terminamos!";
my @lineas = <STDIN>;
print sort @lineas;
