#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

# Procesar, potencialmente, varios archivos de entrada (o la entrada estandar).
# Contaremos la ocurrencia de las palabras en archivos de texto
my %ocurrencias;
while (<>) {
  chomp;
  my @palabras = split;  # equivalente a separar por espacios: split /\s/
  foreach my $palabra (@palabras) {
    $ocurrencias{ lc($palabra) }++; # convertimos a minusculas y sumamos
  }
}

foreach my $palabra ( keys %ocurrencias ) {
  say "$palabra aparece $ocurrencias{$palabra} veces";
}