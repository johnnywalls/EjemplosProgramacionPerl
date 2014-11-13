#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

# para utilizar módulos de la ruta relativa actual
use FindBin;
use lib "$FindBin::Bin/lib";

use EsquemaEjemplo;
use Try::Tiny;

# tambien debemos instalar para este ejemplo
# DateTime::Format::Pg

my $usuario = 'curso';
my $password = 'curso';
my $nombrebd = 'dvdrental';
my $host = '127.0.0.1';
my $dsn = "dbi:Pg:dbname=$nombrebd;host=$host";

my $schema = EsquemaEjemplo->connect($dsn, $usuario, $password, { pg_enable_utf8 => 1 });

# supongamos que estos datos se reciben para una transacción de alquiler y pago

my $fecha_alquiler = '2014-12-10 10:30';
my $id_inventario = 10; # ya indica una pelicula en tienda
my $id_cliente = 1;
my $id_empleado = 1;
my $monto_pagar = 4.95;
my $email_cliente_actualizar = 'mary@example.com';

my ($alquiler, $pago, $cliente);

try {
  $schema->txn_do( sub {
    my $alquiler = $schema->resultset('Rental')->create({
      rental_date => $fecha_alquiler,
      inventory_id => $id_inventario,
      customer_id => $id_cliente, 
      staff_id => $id_empleado,
    });
    # podemos utilizar un objeto para crear otros relacionados,
    # con esto, se utiliza automaticamente el id del alquiler
    # recien insertado al crear el nuevo registro de pago
    my $pago = $alquiler->add_to_payments({
      customer_id => $id_cliente, 
      staff_id => $id_empleado,
      amount => $monto_pagar,
      payment_date => $fecha_alquiler,
    });
    my $cliente = $alquiler->customer;
    $cliente->email( $email_cliente_actualizar );
    $cliente->update;
  });
  say "Transacción realizada exitosamente!";
}
catch {
  my $excepcion = $_;
  say "No se pudo realizar la operación: $excepcion";
};