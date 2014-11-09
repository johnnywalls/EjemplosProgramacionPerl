#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.16;

package Trabajador {
  use Moose;

  has "nombre" => (
    is        => "rw",
    isa       => "Str",
    required  => 1,
  );
  has "cargo" => (
    is        => "rw",
    isa       => "Str",
    default   => "Operario",
  );
}

package Departamento {
  use Moose;

  has "nombre" => (
    is        => "rw",
    isa       => "Str",
    required  => 1,
  );

  has "trabajadores" => (
    traits    => [ "Array" ],
    is        => "rw",
    isa       => "ArrayRef[Trabajador]",
    default   => sub{ [] },
    handles   => {
      agregar_trabajador => "push",
      agregar_trabajadores => "push",
    },
  );

  sub reunion_general {
    my ($self) = @_;
    say "Reunión en " . $self->nombre;
    foreach my $trabajador ( @{$self->trabajadores} ) {
      say "\t- Ha llegado " .
          $trabajador->nombre . " como " .
          $trabajador->cargo;
    }
  }
}

my $sala_control = Departamento->new( nombre => 'Sala de Control' );

my $t1 = Trabajador->new( nombre => 'H. Simpson' );
$sala_control->agregar_trabajador( $t1 );

$t1->nombre( 'Homero Simpson' );

$sala_control->agregar_trabajadores(
  Trabajador->new( nombre => 'Mindy Simmons', cargo => 'Supervisor' ),
  Trabajador->new( nombre => 'Lenny' ),
);

$sala_control->reunion_general();

use Data::Dumper;
say Dumper $sala_control;
