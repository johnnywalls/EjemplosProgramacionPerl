#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

# simulamos un juego donde, luego de sacar un numero aleatorio del 1 al 9,
# ganamos con 0-6, empatamos con 7 y perdemos con 8-9
my $x = int( rand (10) );
if ( $x <= 6 ) {
  say "Ganamos con $x";
}
elsif ( $x == 7 ) {
  say "Empatamos con $x";
}
else {
  say "Perdimos con $x";
}

# Tambien podemos utilizar la clausula given/when
$x = int( rand (10) );
given ($x) {
  when ( [0..6] ) { say "Ganamos con $x" }
  when ( 7 )      { say "Empatamos con $x" }
  default         { say "Perdimos con $x" }
}

# Los condicionales pueden mejorar la legibilidad al usarlos
# luego de otras sentencias
my $nombre = 'pedro';

say "yabbadabbadoo!" if $nombre eq 'pedro';

# en lugar de
if ( $nombre eq 'pedro' ) {
  say "yabbadabbadoo!";
}

# 'unless' tambien puede ser mas intuitivo en construcciones sencillas
say 'No tengo nombre' unless defined $nombre;

# Evaluacion en corto circuito. La funcion ok() devuelve el valor logico
# del primer argumento.  Se usa para programas de prueba (mas adelante)
use Test::More;

say 'Ambas ciertas' if ok( 1, 'verificacion uno' )
                    && ok( 1, 'verificacion dos' );

# en este caso, la segunda evaluacion no se realiza, por la evaluacion
# en corto circuito
say 'Ambas ciertas' if ok( 0, 'verificacion tres' )
                    && ok( 1, 'verificacion cuatro' );

# con OR ||
say 'Alguna cierta' if ok( 1, 'verificacion cinco' )
                    || ok( 0, 'verificacion seis' ); #no se ejecuta la seis

say 'Alguna cierta' if ok( 0, 'verificacion siete' )
                    || ok( 1, 'verificacion ocho' );

done_testing();


