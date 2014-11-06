#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

# cuando usamos print, say, estamos utilizando la salida estandar
say "Salida Estandar";
say STDOUT "Esto tambien va a la salida estandar";

# pero podemos especificar otra salida. Por ejemplo, un archivo
my $nombre_archivo = 'salida.txt';
open ( SALIDA, '>', $nombre_archivo ) or die "No pude abrir $nombre_archivo: $!";

say SALIDA "Esto va directamente al archivo";
say "Esto a la salida estandar";
say SALIDA "Y de nuevo al archivo $nombre_archivo";

# tambien podemos dar formato a nuestra salida con printf
# (de manera similar a C,C++)
printf "%-10s: %.2f\n", 'PI', 3.14159;
# o a otro flujo de salida
printf SALIDA "%-10s: %.4f\n", 'e', exp(1);

close SALIDA;

# tambien podemos escribir hacia la salida de error estandar
say STDERR "Este mensaje va a la salida de error estandar";
