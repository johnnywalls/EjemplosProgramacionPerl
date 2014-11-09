#!perl -T
use v5.16;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'CursoPerl::Ejemplos::Ocurrencias' ) || print "Bail out!\n";
}

diag( "Testing CursoPerl::Ejemplos::Ocurrencias $CursoPerl::Ejemplos::Ocurrencias::VERSION, Perl $], $^X" );
