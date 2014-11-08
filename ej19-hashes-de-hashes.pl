#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

use Data::Dumper;

my $empresa = {
  'Junta Directiva' => {
    'M. Burns' => 'Presidente',
    'Smithers' => 'Asistente', #?
  },
  'Seguridad Industrial' => {
    'Lenny' => 'Supervisor',
    'Carlson' => 'Supervisor',
  },
  'Operaciones' => {
    'H. Simpson' => 'Operario', #?
    'Mindy Simmons' => 'Operario',
  },
};

say Dumper $empresa;

say "Tenemos " . keys($empresa) . ' departamentos en la Planta Nuclear de Springfield: ';
say join ', ', keys($empresa);
my @empleados;
foreach my $departamento ( keys %$empresa ) {
  push @empleados, keys %{ $empresa->{ $departamento } };
}
say "y un total de " . scalar(@empleados) . " empleados: " . join(', ', @empleados);

my %total_por_cargo;
foreach my $departamento ( keys %$empresa ) {
  foreach my $cargo ( values %{ $empresa->{ $departamento } } ) {
    $total_por_cargo{ $cargo }++;
  }
}
say "Total de empleados según cargo:";
foreach ( sort keys %total_por_cargo ) {
  say "$_: $total_por_cargo{$_}";
}

