#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

use Data::Dumper;

use DBI;
use Try::Tiny;

my $usuario = 'curso';
my $password = 'curso';
my $nombrebd = 'dvdrental';
my $host = '127.0.0.1';
my $dsn = "dbi:Pg:dbname=$nombrebd;host=$host";

my $dbh = DBI->connect($dsn, $usuario, $password, { pg_enable_utf8 => 1, RaiseError => 1, AutoCommit => 0 })
or die "No se pudo conectar a PostgreSQL: " . $DBI::errstr;

# supongamos que estos datos se reciben para una transacción de alquiler y pago

my $fecha_alquiler = '2014-12-01 10:30';
my $id_inventario = 10; # ya indica una pelicula en tienda
my $id_cliente = 1;
my $id_empleado = 1;
my $monto_pagar = 4.95;
my $email_cliente_actualizar = 'mary.smith@example.com';

# ejemplo de transacción

my $sql_insertar_alquiler =<<SQL;
INSERT INTO rental
  (rental_date, inventory_id, customer_id, staff_id)
VALUES ( ?, ?, ?, ? )
SQL

my $sql_insertar_pago =<<SQL;
INSERT INTO payment
  (customer_id, staff_id, rental_id, amount, payment_date)
VALUES ( ?, ?, ?, ?, ? )
SQL

my $sql_actualizar_email =<<SQL;
UPDATE customer
  SET email = ?
WHERE customer_id = ?
SQL

try {
  #$dbh->begin_work; # no es necesario al colocar AutoCommit => 0

  my $sth_insertar_alquiler = $dbh->prepare( $sql_insertar_alquiler );
  $sth_insertar_alquiler->execute( $fecha_alquiler, $id_inventario, $id_cliente, $id_empleado );
  my $id_alquiler = $dbh->last_insert_id(undef,"public","rental","rental_rental_id_seq");

  my $sth_insertar_pago = $dbh->prepare( $sql_insertar_pago );
  $sth_insertar_pago->execute( $id_cliente, $id_empleado, $id_alquiler, $monto_pagar, $fecha_alquiler );

  $dbh->do( $sql_actualizar_email, undef, $email_cliente_actualizar, $id_cliente );

  $dbh->commit;

  say "Transacción realizada exitosamente!";
}
catch {
  say "No se pudo realizar la operación: " . $DBI::errstr;
  eval { $dbh->rollback };
}
finally {
  $dbh->disconnect;
};

