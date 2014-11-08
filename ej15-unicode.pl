#!/usr/bin/env perl

use strict;
use warnings;
use utf8;  # para poder escribir utf8 en el código

use v5.16; # desde Perl 5.16 tenemos Unicase Folding (fc)

use POSIX qw(strftime);
my $año = strftime "%Y", localtime;

binmode STDOUT, ':utf8'; # declarar modo de salida en utf8
my $saludo = "¡Hola! Estamos en el año $año";
say $saludo;

## También podríamos declara un modo 'global' de utf8
## para todos los flujos de entrada y salida con:
## use utf8::all;

# Declarar codificación de caracteres al abrir archivo
my $nombre_archivo = 'quijote1.txt';
open (QUIJOTE, '<:utf8', $nombre_archivo)
     or die "No pude abrir el archivo $nombre_archivo: $!";

# Procesar, potencialmente, varios archivos de entrada (o la entrada estandar).
# Contaremos la ocurrencia de las palabras en archivos de texto
my %ocurrencias;
while (<QUIJOTE>) {
  chomp;
  my @palabras = ( $_ =~ m/(\p{IsAlpha}+)/g );  # equivalente a separar por espacios: split /\s/
  foreach my $palabra (@palabras) {
    $ocurrencias{ fc($palabra) }++; # usamos fc, Unicode Case Folding
  }
}
close QUIJOTE;

foreach my $palabra ( sort { $ocurrencias{$b} <=> $ocurrencias{$a} } keys %ocurrencias ) {
  say "'$palabra' aparece $ocurrencias{$palabra} veces" if $ocurrencias{$palabra} > 10;
}

# convertir entre codificaciones de caracteres
use Encode ( qw/ encode decode /);
my $datos_externos; # datos leidos previamente desde un origen externo
my $desde_utf8 = decode('utf8', $datos_externos); # convertir a representación interna de Perl
my $hacia_latin1 = encode('iso-8859-1', $saludo);

say $hacia_latin1;

# unicode al ordenar
use Unicode::Collate;

foreach my $palabra ( Unicode::Collate->new->sort( keys %ocurrencias ) ) {
  say "'$palabra' aparece $ocurrencias{$palabra} veces" if $ocurrencias{$palabra} > 10;
}

# Unicode en expresiones regulares
say "Buscar palabras con ñ";
foreach my $palabra ( grep( /ñ/,  keys %ocurrencias ) ) {
  say "'$palabra' aparece $ocurrencias{$palabra} veces";
}

# o tambien usando secuencias de códigos Unicode
say "Buscar palabras con á";
foreach my $palabra ( grep( /\x{00E1}/,  keys %ocurrencias ) ) {
  say "'$palabra' aparece $ocurrencias{$palabra} veces";
}
