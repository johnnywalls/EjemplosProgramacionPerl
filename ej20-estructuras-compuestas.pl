#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

use Data::Dumper;

sub llamada_local {
  say "Hola Springfield!";
}

sub llamada_larga_distancia {
  say "Operadora, por favor...";
}

my $memoria = {
  contactos => [
    {
      nombre => 'Bob',
      apellido => 'Patiño',
      telefonos => { '1234567' => 'celular', '2345678' => 'casa' },
      llamar => \&llamada_local,
    },
    {
      nombre => 'Krusty',
      email => 'payaso@example.com',
      llamar => \&llamada_larga_distancia,
    },
  ],
  agenda => {
    '2015-01-01' => [ 'dormir todo el día' ],
    '2014-12-31' => [ 'cocinar', 'celebrar noche vieja' ],
    '2015-01-06' => [ 'correr a buscar regalos', 'esconder regalos' ],
  },
};

# agregar una actividad
push @{ $memoria->{agenda}->{'2015-01-06'} }, 'entregar regalos';
say Dumper $memoria;
# Agregar un telefono a contacto existente
$memoria->{contactos}->[1]->{ telefonos }->{ '9876543' } = 'celular';
say Dumper $memoria;

# listar nombres y telefonos de contacto
foreach my $contacto ( @{ $memoria->{ contactos } } ) {
  my $mostrar = ( $contacto->{nombre} // '' ) . ' ' . ( $contacto->{apellido} // '' );
  my @telefonos = keys %{ $contacto->{ telefonos } };
  say "Contacto: $mostrar\tTeléfonos: @telefonos";
}

my $bob = $memoria->{contactos}->[0];
say "Llamando a $bob->{nombre}:";
$bob->{llamar}->();
