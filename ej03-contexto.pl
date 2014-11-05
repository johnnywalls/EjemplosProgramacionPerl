#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

use Data::Dumper;

my @personas = qw ( hugo paco luis ); # lista
my $personas = @personas; # escalar
say "Tenemos a @personas. Son $personas en total";
say 2 + @personas; # escalar

say Dumper( sort @personas ); # sort, lista

# Evaluar expresiones de lista en contexto escalar
# Noten el comportamiento diferente de reverse segun el contexto
my @pedro = reverse qw/ yabba dabba doo /;
say Dumper(@pedro);

my $pedro = reverse qw/ yabba dabba doo /;
say Dumper( $pedro );

my ( $d1, $d2 ) = qw( lunes martes miercoles  ); # contexto de lista

my ( $dia ) = qw( lunes martes miercoles  ); # aun en contexto de lista

# en contexto escalar, qw retorna el ultimo elemento.
# Notese la advertencia (activada por use warnings)
my $dias = qw( lunes martes miercoles );

if ( @personas ) { # contexto escalar -> logico
  say 'Tenemos fiesta!';
}

if ( scalar @personas ) { # forzar contexto escalar
  say 'Otra vez!';
}

# print, say, se ejecutan en contexto de lista
say @personas;
say "@personas"; # al interpolar se convierte en una cadena escalar,
                 # pero aun la expresion se ejecuta en contexto de lista:
say "Tenemos ", @personas, " personas!"; # incorrecto
say "Tenemos ", scalar @personas, " personas!"; # BIEN!

# while repite el ciclo mientras la condicion logica sea cierta
while ( @personas ) { # contexto logico
  my $nombre = shift @personas;
  say "Se fue $nombre";
  say "Quedan @personas" if @personas; #Interpolacion de lista. Contexto logico
}

