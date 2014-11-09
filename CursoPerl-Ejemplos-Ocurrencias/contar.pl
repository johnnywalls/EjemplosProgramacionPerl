#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

# para utilizar módulos de la ruta relativa "lib"
use Cwd qw(abs_path);
use FindBin;
use lib abs_path("$FindBin::Bin/lib");

use CursoPerl::Ejemplos::Ocurrencias;

CursoPerl::Ejemplos::Ocurrencias::contar_ocurrencias( ARCHIVO => 'quijote1.txt', REPETICIONES => 5 );