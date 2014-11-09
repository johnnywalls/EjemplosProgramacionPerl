#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.16;

package Springfield::Personaje {
  use Moose;
  use Graphics::Color::RGB;

  has "nombre" => (
    is        => "rw",
    isa       => "Str",
  );
  has "apellido" => (
    is        => "ro",
    isa       => "Str",
    default   => "Simpson",
  );
  has "color" => (
    is        => "ro",
    isa       => "Str",
    default   => "amarillo",
  );
  has "color_paleta" => (
    is        => "ro",
    isa       => "Graphics::Color::RGB",
    builder   => '_build_color',
    lazy      => 1,
    handles   => { color_hex => 'as_hex_string' },
    init_arg  => undef,
  );
  has "año_aparicion" => (
    is        => "rw",
    isa       => "Int",
    default   => 1989,
  );

  sub _build_color {
    my $self = shift;
    # podriamos usar aqui otro modulo de CPAN, pero vale para el ejemplo
    my $colores = {
      amarillo => {r => 1, g => 1, b => 0 },
      azul => {r => 0, g => 0, b => 0 },
      rojo => {r => 1, g => 0, b => 0 },
    };
    my $color = $colores->{ $self->color } if exists $colores->{ $self->color };
    die "Color desconocido" unless $color;
    return Graphics::Color::RGB->new( { r => $color->{r}, g => $color->{g}, b => $color->{b} } );
  }

  sub nombre_completo {
    my $self = shift;
    return ($self->nombre ? $self->nombre . ' ' : '' ) . $self->apellido;
  }
}

my $bart = Springfield::Personaje->new( nombre => 'Bart' );
say "Mi nombre es " . $bart->nombre_completo;
say "Soy de color " . $bart->color . ", en hexadecimal: " . $bart->color_hex;
say "Estoy en el show desde " . $bart->año_aparicion;

my $devil = Springfield::Personaje->new(
  nombre => 'D.',
  apellido => 'Maligno',
  año_aparicion => 1995,
  color => 'rojo',
);
say "Mi nombre es " . $devil->nombre_completo;
say "Soy de color " . $devil->color . ", en hexadecimal: " . $devil->color_hex;
say "Estoy en el show desde " . $devil->año_aparicion;

my $pepe = Springfield::Personaje->new(
  nombre => 'Pepe',
  color => 'verde',
); # no tenemos error aún, ya que usamos la construcción "perezosa" (lazy) de color

say "Mi nombre es " . $pepe->nombre_completo;
say "Soy de color " . $pepe->color . ", en hexadecimal: " . $pepe->color_hex;

