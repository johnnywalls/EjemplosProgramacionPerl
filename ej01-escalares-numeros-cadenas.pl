#!/usr/bin/env perl

use strict;
use warnings;
use v5.10; # para utilizar algunas características como "say"

# numeros
my $n = 255;
print "El valor de \$n es $n \n";
my $decimal = 1.25;
print 'El valor $decimal es: ' . $decimal . "\n";
$decimal = 7.25e4;
say "Y ahora es $decimal";

my $cadena = 'Aqui todo es "literal". Escapar comillas simples como \' ';
say $cadena;
my $otracadena = "Podemos \n saltar \n lineas, \t colocar \t tabuladores";
say $otracadena;

my $nombre = 'Pepe';
my $direccion = 'Calle Serra #127';

say "$nombre vive en $direccion";
say $nombre . ' vive en ' . $direccion;

# escapar comillas
say "Su nombre es \"$nombre\"";
# o de manera alternativa
say qq{Su nombre es "$nombre"};
# tambien podemos utilizar otros delimitadores para comillas
say q^Vimos la obra 'Guerra de las Galaxias'^;
say q{Vamos al restaurante Pepe's};

# usar sintaxis "heredoc"
my $cita = <<'FIN_CITA';
Nulla quis turpis quis urna "scelerisque ullamcorper" quis eu felis. In
sodales risus bibendum, dignissim diam quis, euismod elit?

Praesent vitae enim molestie, ullamcorper metus vitae, cursus dolor. Cras
ultricies vitae mi in vestibulum!
FIN_CITA

say $cita;

