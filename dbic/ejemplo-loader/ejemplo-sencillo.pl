#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

# para utilizar módulos de la ruta relativa actual
use FindBin;
use lib "$FindBin::Bin/lib";

use EsquemaEjemplo;

my $usuario = 'curso';
my $password = 'curso';
my $nombrebd = 'dvdrental';
my $host = '127.0.0.1';
my $dsn = "dbi:Pg:dbname=$nombrebd;host=$host";

my $schema = EsquemaEjemplo->connect($dsn, $usuario, $password, { pg_enable_utf8 => 1 });

# ubicar un registro por su clave primaria
my $film = $schema->resultset('Film')->find(123);
say "Título: " . $film->title;
say "Descripción: " . $film->description;
say "Idioma: " . $film->language->name;
say "Actores:";

foreach ( $film->film_actors ) {
  say ' - ' . $_->actor->first_name . ' ' . $_->actor->last_name;
}

my @categorias = map $_->category->name, $film->film_categories->all;

say "Categorías: " . join( ',' , @categorias );

say "Total ejemplares en existencia: " . $film->inventories->count;

# Aquí usamos los inventarios de una película como una subconsulta
say "Alquileres recientes:";
my $inventarios_pelicula = $film->inventories;
my $alquileres_recientes = $schema->resultset('Rental')->search({
  inventory_id => { '-in' => $inventarios_pelicula->get_column('inventory_id')->as_query } #aqui la subconsulta
}, { order_by => 'rental_date DESC', rows => 5 } );

while ( my $alquiler = $alquileres_recientes->next ) {
  say "\t- Fecha: " . $alquiler->rental_date->strftime('%d/%m/%Y %I:%M %p') . 
      "\tCliente: " . $alquiler->customer->first_name . ' ' . $alquiler->customer->last_name;
}

