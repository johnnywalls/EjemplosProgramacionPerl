#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.16;

package Springfield::Personaje {
  use Moose;

  has "nombre" => (
    is        => "rw",
    isa       => "Str",
  );
  has "apellido" => (
    is        => "ro",
    isa       => "Str",
    default   => "Simpson",
  );

  sub nombre_completo {
    my $self = shift;
    return ($self->nombre ? $self->nombre . ' ' : '' ) . $self->apellido;
  }
}

package Springfield::Invitado {
  use Moose;

  extends 'Springfield::Personaje'; #herencia

  has "capitulos" => (
    traits    => [ "Array" ],
    is        => "rw",
    isa       => "ArrayRef[Str]",
    default   => sub{ [] },
    handles   => {
      agregar_capitulo => "push",
      agregar_capitulos => "push",
      total_capitulos => "count",
      nombres_capitulos => "join",
    },
  );
}

my $kim = Springfield::Invitado->new( nombre => 'Kim', apellido => 'Bassinger' );
$kim->agregar_capitulo( 'When You Dish Upon a Star' );

my $sh = Springfield::Invitado->new( nombre => 'Stephen', apellido => 'Hawking' );
$sh->agregar_capitulos(
  "They Saved Lisa's Brain",
  "Behind the Laughter",
  "Don't Fear the Roofer",
  "Stop or My Dog Will Shoot!",
  "Elementary School Musical",
);

say $kim->nombre_completo . " aparece en " . $kim->capitulos->[0];
say $sh->nombre_completo . " aparece en " . $sh->total_capitulos . ':';
say $sh->nombres_capitulos(', ');
