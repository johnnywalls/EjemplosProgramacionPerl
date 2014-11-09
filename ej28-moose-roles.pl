#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.16;

package PuedeVolar {
  use Moose::Role;

  has "alcance", is => 'rw', isa => 'Str';

  requires qw( metodo_propulsion volar );

  after 'volar' => sub {
    my $self = shift;
    say "Alcance de vuelo hasta " . $self->alcance if $self->alcance;
  };
}

package Animal {
  use Moose;
  has "especie", is => 'ro', isa => 'Str', required => 1;
  has "nombre", is => 'rw', isa => 'Str', required => 1;
}

package AnimalVolador {
  use Moose;
  extends 'Animal';

  has "metodo_propulsion", is => 'ro', isa => 'Str', default => 'alas', required => 1;

  with 'PuedeVolar';

  sub volar {
    my $self = shift;

    say "Vuelo por mis propios medios con " . $self->metodo_propulsion;
  }
}

package Aeronave {
  use Moose;

  has "tipo", is => 'ro', isa => 'Str', required => 1;
  has "metodo_propulsion", is => 'rw', isa => 'Str', required => 1;
  has "capacidad_pasajeros", is => 'rw', isa => 'Int';

  with 'PuedeVolar';

  sub volar {
    my $self = shift;
    my $vuelo = "El " . $self->tipo . " vuela con " . $self->metodo_propulsion;
    $vuelo .= " y puede llevar " . $self->capacidad_pasajeros . ' pasajeros' if $self->capacidad_pasajeros;
    say $vuelo;
  }
}

my $avion = Aeronave->new( tipo => '777-300', metodo_propulsion => 'Turbinas' );
$avion->capacidad_pasajeros(368);
$avion->alcance( '11000 Km' );

my @objetos = (
  $avion,
  AnimalVolador->new( especie => 'Águila', nombre => 'Aguilera' ),
  Animal->new( especie => 'Pinguino', nombre => 'Larry' ),
);

my $n;

foreach (@objetos) {
  say ++$n;
  say "Me llamo " . $_->nombre . " y soy un " . $_->especie if $_->isa('Animal');
  $_->does('PuedeVolar') ? $_->volar() : say 'No puedo volar';
}