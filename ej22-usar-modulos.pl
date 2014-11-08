#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.16;

# en este ejemplo, utilizaremos Getopt::Long para
# interpretar parámetros de la línea de comandos a
# nuestro programa

use Getopt::Long;

# Tambien utilizaremos File::Basename (subrutinas específicas)
use File::Basename qw/ basename dirname /;

# valores predeterminados para los parametros
my $archivo = "quijote1.txt";
my $repeticiones = 1;
my @buscar;
my $debug;

# tenemos acceso a la rutina GetOptions exportada de manera predeterminada
# por Getopt::Long
GetOptions ("repeticiones=i" => \$repeticiones,  # entero
            "archivo=s"      => \$archivo,       # cadena
            "buscar=s"       => \@buscar,        # lista de cadenas
            "debug"          => \$debug)         # flag/logico
or die("Error en los parámetros del comando\n");

my $nombre_archivo = basename( $archivo );
my $directorio_archivo = dirname( $archivo );

open (ARCHIVO, '<', $archivo)
     or die "No pude abrir el archivo $archivo: $!";

my %ocurrencias;
my ($nlineas,$npalabras);
while (<ARCHIVO>) {
  chomp;
  $nlineas++ if $debug;
  my @palabras = ( $_ =~ m/(\p{IsAlpha}+)/g );
  $npalabras = scalar @palabras if $debug;
  foreach my $palabra (@palabras) {
    if ( scalar(@buscar) == 0 || $palabra ~~ @buscar ) {
      $ocurrencias{ fc($palabra) }++;
    }
  }
}
close ARCHIVO;

if ( $debug ) {
  say "Procesado $nombre_archivo (ubicado en directorio $directorio_archivo)";
  say "con $nlineas lineas y $npalabras palabras en total";
}

foreach my $palabra ( sort { $ocurrencias{$b} <=> $ocurrencias{$a} } keys %ocurrencias ) {
  say "'$palabra' aparece $ocurrencias{$palabra} veces" if $ocurrencias{$palabra} >= $repeticiones;
}


