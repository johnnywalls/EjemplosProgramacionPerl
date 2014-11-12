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

# listar pagos mayores o iguales a 5$ registrados en un rango de fechas,
# obteniendo también los datos de cliente y empleado
my $listado_pagos = $schema->resultset('Payment')->listar_pagos_rango_fecha('2007-02-12 00:00:00', '2007-02-18 23:59:59');
printf "%-30s %-30s %-20s %-8s\n", 'Cliente', 'Empleado', 'Fecha', 'Monto';
say '-' x 90;
foreach ( $listado_pagos->all ) {
  printf "%-30s %-30s %-10s %5.2f\n",
         $_->customer->full_name, 
         $_->staff->full_name, 
         $_->payment_date->strftime('%d/%m/%Y %I:%M %p'),
         $_->amount;
}
say '-' x 90;


# listar películas según cantidad en inventario. No especificamos condiciones (where)
# en el primer parámetro
my $listado_peliculas_inventario = $schema->resultset('Film')->listar_inventarios();

printf "%-5s %-50s %-5s\n", 'ID', 'Film', 'Total';
say "-" x 63;
foreach ( $listado_peliculas_inventario->all ) {
  printf "%-5s %-50s %5d\n", $_->film_id, $_->title, $_->get_column('total');
}
say "-" x 63;
printf "%-5s %-50s %5d\n", 'TOTAL', $listado_peliculas_inventario->count, $listado_peliculas_inventario->get_column('total')->sum;
