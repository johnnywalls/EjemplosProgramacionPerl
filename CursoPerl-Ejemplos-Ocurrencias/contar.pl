#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

# para utilizar módulos de la ruta relativa "lib"
use Cwd qw(abs_path);
use FindBin;
use lib abs_path("$FindBin::Bin/lib");

use CursoPerl::Ejemplos::Ocurrencias;

use Getopt::Long;
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

CursoPerl::Ejemplos::Ocurrencias::contar_ocurrencias(
  ARCHIVO => $archivo,
  REPETICIONES => $repeticiones,
  BUSCAR => \@buscar,
  DEBUG => $debug,
);