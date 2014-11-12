#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

# para utilizar módulos de la ruta relativa actual
use FindBin;
use lib "$FindBin::Bin";

use EsquemaEjemplo;

# tambien debemos instalar para este ejemplo
# DateTime::Format::Pg

my $usuario = 'curso';
my $password = 'curso';
my $nombrebd = 'dvdrental';
my $host = '127.0.0.1';
my $dsn = "dbi:Pg:dbname=$nombrebd;host=$host";

my $schema = EsquemaEjemplo->connect($dsn, $usuario, $password, { pg_enable_utf8 => 1 });

# ubicar un registro por su clave primaria
my $un_actor = $schema->resultset('Actor')->find(1);
say "Nombre: " . $un_actor->first_name . ' ' . $un_actor->last_name;

my $rs_busqueda = $schema->resultset('Actor')->search( { 'last_name' => 'Kilmer' } );
foreach my $actor ( $rs_busqueda->all ) {
  say $actor->id . ' - ' . $actor->first_name . ' ' . $actor->last_name . ' - ' . $actor->last_update->strftime('%d/%m/%Y');
}