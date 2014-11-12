#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

use Data::Dumper;

use DBI;

my $usuario = 'curso';
my $password = 'curso';
my $nombrebd = 'dvdrental';
my $host = '127.0.0.1';
my $dsn = "dbi:Pg:dbname=$nombrebd;host=$host";

my $dbh = DBI->connect($dsn, $usuario, $password, { pg_enable_utf8 => 1 })
or die "No se pudo conectar a PostgreSQL: " . $DBI::errstr;

my $monto = 8;
my $max_registros = 10;

my $sql =<<SQL;
SELECT
c.customer_id,
c.email,
p.amount,
p.payment_date
FROM payment p JOIN customer c USING (customer_id)
WHERE amount > ?
ORDER BY payment_date DESC LIMIT ?
SQL

# ejemplos en "un solo paso"

my $arr_pagos = $dbh->selectall_arrayref( $sql, { Slice => {} }, $monto, $max_registros )
or die "No se pudo ejecutar la consulta: " . $DBI::errstr;
say Dumper $arr_pagos;

my $arr_emails = $dbh->selectcol_arrayref( $sql, { Columns=> [2] }, $monto, $max_registros )
or die "No se pudo ejecutar la consulta: " . $DBI::errstr;
say Dumper $arr_emails;

my $primer_pago = $dbh->selectrow_hashref( $sql, {}, $monto, $max_registros )
or die "No se pudo ejecutar la consulta: " . $DBI::errstr;
say Dumper $primer_pago;

# ejemplos con prepare/execute/fetch

my $sth = $dbh->prepare($sql);

if ( $sth->execute( $monto, $max_registros ) ) {
  printf "%-40s %-8s %-s\n", qw/Email Monto Fecha/;
  while ( my $pago = $sth->fetchrow_hashref ) {
    printf "%-40s %5.2f %s\n", $pago->{email}, $pago->{amount}, $pago->{payment_date};
  }
}
else {
  die "No se pudo ejecutar la consulta: " . $DBI::errstr;
}

$dbh->disconnect;