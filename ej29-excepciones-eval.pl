#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

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

# ya que $@ es una variable global, es buena práctica localizarla
# (copiar su valor en una variable léxica local) para prevenir
# que se pierda el valor posteriormente
local $@;

my $fh = eval { abrir_archivo_bitacora( $archivo ); };

# debemos preguntar por $@ inmediatamente después de eval
if ( my $excepcion = $@ ) {
  # Relanzaremos la excepción (no podemos manejarla)
  # salvo en caso de que se trate de no poder abrir el archivo.
  # En ese caso, utilizaremos un medio distinto para la bitácora
  die $excepcion unless $excepcion =~ /^No se pudo abrir/;
  $fh = utilizar_syslog();
}
