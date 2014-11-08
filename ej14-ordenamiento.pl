#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my @numeros = map int(rand(100)), 1..20;
my @nombres = qw( hugo paco luis pepe jose juan diego javi );

my @nombres_ordenados = sort @nombres;
say "Nombres ordenados: @nombres_ordenados";

my @numeros_ordenados = sort @numeros;
say "Numeros ordenados (o no?): @numeros_ordenados"; # incorrecto, orden lexico ('alfabetico')

# proporcionar una rutina de ordenamiento
@numeros_ordenados = sort { $a <=> $b } @numeros;
say "Numeros ordenados: @numeros_ordenados";

# orden reverso
@numeros_ordenados = sort { $b <=> $a } @numeros;
say "Numeros ordenados a la inversa: @numeros_ordenados";

my @personas = (
  { nombre => 'Bart',   apellido => 'Simpson',  edad => 12 },
  { nombre => 'Lisa',   apellido => 'Simpson',  edad => 10 },
  { nombre => 'Marge',  apellido => 'Simpson',  edad => 38 },
  { nombre => 'Homero', apellido => 'Simpson',  edad => 40 },
  { nombre => 'Ned',    apellido => 'Flanders', edad => 39 },
  { nombre => 'Seymour',apellido => 'Skinner',  edad => 43 },
);

# ordenar por un campo
sub por_nombre {
  $a->{nombre} cmp $b->{nombre};
}

sub por_apellido {
  $a->{apellido} cmp $b->{apellido};
}

# ordenar por varios criterios: apellido alfabetico y edad descendente
sub por_apellido_y_edad {
  $a->{apellido} cmp $b->{apellido} || $b->{edad} <=> $a->{edad};
}

sub listar {
  my $reflista = shift;
  say '-' x 20;
  foreach (@$reflista) {
    say "Apellido: $_->{apellido}\tNombre: $_->{nombre}\tEdad: $_->{edad}";
  }
}

# listar segun edad
listar [ sort { $a->{edad} <=> $b->{edad} } @personas ];
# utilizar subrutinas de ordenamiento
listar [ sort por_apellido @personas ];
listar [ sort por_nombre @personas ];
listar [ sort por_apellido_y_edad @personas ];
