#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

# precedencia de *
say 2 + 3 * 4;

# construccion muy utilizada. Tambien podriamos usar 'or' (ver precedencia)
chdir $ENV{HOME} || die 'Sin directorio personal!';

# notar alta precedencia de sort
my @a = ( 1, 3, sort 4, 2 );
say "@a";

# autoincremento 'magico' en cadenas
my $cad;
$cad = "99"; say $cad++; say $cad;
$cad = "Bz"; say ++$cad;
$cad = "zz"; say ++$cad;

# de nuevo, precedencia de operadores. Siempre podemos inclur parentesis
# para hacer explicita la intencion de evaluacion
say -2 ** 4;
say (-2) ** 4; # equivalente a (say -2) ** 4
say ( (-2) ** 4 );

# linea de guiones (contexto escalar/cadena)
say "-" x 60;

# en contexto de lista
my @l = (1) x 10;
say "@l";

# desplazamiento de bits
say 1 << 4;
say 32 >> 4;

# cuidado con la precision
say 500 << 200;
use bigint;
say 500 << 200;
no bigint; # si queremos desactivar el pragma anterior

# verificar si un "archivo" existe
my $d = '/tmp';
say -e $d;

# si es un directorio
say -d $d;

# o un "archivo regular". Aprovechamos de utilizar el condicional abreviado
say -f $d ? "$d Es un archivo regular" : "$d No es un archivo regular";

# comparaciones
say 3 < 5;
say "hola" > "adios"; # incorrecto, genera advertencias
say "hola" gt "adios";
my $x;
say 'cadena vacia' if $x eq ''; # incorrecto, genera advertencia
say 'cadena vacia' if ( defined $x && $x eq '' ); # correcto, pero $x no es cadena vacia
say "El valor es $x" if defined $x;
say 'Valor de $x no definido' unless defined $x;

# operador utilizado para proveer valores predeterminados
my $var = $x // 0;
say $var;
# o incluso
$x //= 0;  # equivalente $x = $x // 0;

# Notese que la asignacion 'abreviada' hace que la expresion objetivo
# se evalue una sola vez.
my $var;
my @arr = 1 .. 10;
$arr[ ++$var ] += 2; # var pasa de undef (0) a 1
say "Arreglo: @arr Valor: $var";

$arr[ ++$var ] = $arr[ ++$var ] + 2; # var pasa de 1 a 3 al final. Se suma 3 + 2
say "Arreglo: @arr Valor: $var";

# rangos
say 1..10;
say "A".."Z";

my ($xyz, $y, $z); # idioma comun para declarar varias variables
$xyz = $x || $y || $z; # selecciona el primer valor 'cierto' en x, y o z
$xyz = $x or $y or $z;  # incorrecto, 'or' tiene menos precedencia que =
$xyz = ( $x or $y or $z ); # correcto


