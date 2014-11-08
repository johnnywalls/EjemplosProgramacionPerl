#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

# coincidencia con un patron de matriculas vehiculares
my $texto = 'El auto llevaba la placa 98765 ABC, y llevaba Color azul';
if ( $texto =~ m/(\d{5}[\s|\-][A-Z]{3}).*color\s(\w+)/i ) {
  say "Matricula: $1\t Color: $2";
}

# buscar y reemplazar
$texto =~ s/llevaba/tiene/g;
say $texto;

# podemos 'salvar' una expresion regular precompilada para reutilizarla, con qr
my $letras = qr{\p{IsAlpha}+};

my @palabras = ($texto =~ m/($letras)/g);
say "@palabras";

# inicio y fin de cadena/linea
my $texto2 = "Primera linea de texto
que seguimos escribiendo
para ocupar varias.
Solo queremos demostrar el uso de
Expresiones regulares.";

# comienzo de linea. Funciona en modo multilinea
my @lineas = ( $texto2 =~ /^\p{IsUpper}.*/mg );
foreach ( @lineas ) {
  say "La linea comienza en mayuscula: $_";
}

# Comienzo de 'cadena'
@lineas = ( $texto2 =~ /\A\p{IsUpper}.*/mg );
foreach ( @lineas ) {
  say "La cadena comienza en mayuscula: $_";
}

# lo mismo con el final: $ o \z
@lineas = ( $texto2 =~ /.*\.$/mg );
foreach ( @lineas ) {
  say "La linea termina en punto: $_";
}
@lineas = ( $texto2 =~ /.*\.\z/mg );
foreach ( @lineas ) {
  say "La cadena termina en punto: $_";
}

# Utilizar coincidencias en la misma expresion
# Aca queremos extraer las palabras que contengan
# dos letras repetidas (ej: amamanta, bebe...)
my $diccionario = '/usr/share/dict/spanish';
open (DICCIONARIO, '<', $diccionario) or die "No se pudo abrir $diccionario: $!";
@palabras = <DICCIONARIO>;
close DICCIONARIO;
say "Palabras con dos letras repetidas:";
foreach ( @palabras ) {
  chomp;
  say "$_ (se repite $1)" if /(..)\1/g; # aca \1 tambien pudo ser \g{1}
}

# abrimos explicitamente un archivo, en modo de solo lectura
my $nombre_archivo = 'quijote1.txt';
open (QUIJOTE, '<', $nombre_archivo)
     or die "No pude abrir el archivo $nombre_archivo: $!";

# Procesar, potencialmente, varios archivos de entrada (o la entrada estandar).
# Contaremos la ocurrencia de las palabras en archivos de texto
my %ocurrencias;
while (<QUIJOTE>) {
  chomp;
  my @palabras = ( $_ =~ m/($letras)/g ); # reutilizamos la expresion guardada
  foreach my $palabra (@palabras) {
    $ocurrencias{ lc($palabra) }++; # convertimos a minusculas y sumamos.
                                    # Mas adelante trataremos el tema de
                                    # codificacion de caracteres (utf-8)
  }
}
close QUIJOTE;

# mostramos las palabras que aparecen mas de 30 veces
foreach my $palabra ( sort keys %ocurrencias ) {
  say "'$palabra' aparece $ocurrencias{$palabra} veces" if $ocurrencias{$palabra} > 30;
}
