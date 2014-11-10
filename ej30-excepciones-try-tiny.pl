#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

use Try::Tiny;

sub abrir_archivo_bitacora {
  my $ruta = shift;
  open my $fh, '>>', $ruta or die "No se pudo abrir $ruta: $!";
  say $fh "echo 1 2 3 ...";
  return $fh;
}

sub utilizar_syslog {
  say "Utilizaremos syslog en lugar de un archivo de bitácora";
  # aqui vendria el resto de la implementacion
  ...
}

my $archivo = $ARGV[0] or die "Especifique un archivo para bitácora";
my $fh;

try {
  $fh = abrir_archivo_bitacora( $archivo );
}
catch {
  # usamos $_ en lugar de $@
  my $excepcion = $_;
  die $excepcion unless $excepcion =~ /^No se pudo abrir/;
  $fh = utilizar_syslog();
}
finally {
  say "Si especificamos un bloque finally, se ejecutará haya excepción o no";
};

