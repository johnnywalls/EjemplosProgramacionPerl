#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

# abrimos explicitamente un archivo, en modo de solo lectura
my $nombre_archivo = 'quijote1.txt';
open (QUIJOTE, '<', $nombre_archivo)
     or die "No pude abrir el archivo $nombre_archivo: $!";

# Procesar, potencialmente, varios archivos de entrada (o la entrada estandar).
# Contaremos la ocurrencia de las palabras en archivos de texto
my %ocurrencias;
while (<QUIJOTE>) {
  chomp;
  my @palabras = split;  # equivalente a separar por espacios: split /\s/
  foreach my $palabra (@palabras) {
    $ocurrencias{ lc($palabra) }++; # convertimos a minusculas y sumamos.
                                    # Mas adelante trataremos el tema de
                                    # codificacion de caracteres (utf-8)
  }
}
close QUIJOTE;

foreach my $palabra ( sort keys %ocurrencias ) {
  say "$palabra aparece $ocurrencias{$palabra} veces";
}
