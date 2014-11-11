#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.10;

use Data::Dumper;

use DBI;

say "Drivers disponibles: " . Dumper( [ DBI->available_drivers ] );

my $usuario = 'curso';
my $password = 'curso'; # según el SMBD, podría utilizarse un archivo separado
                        # para la contraseña y no necesitarla en el programa

## ejemplo con PostgreSQL
my $dbh_pg = DBI->connect("dbi:Pg:dbname=dvdrental;host=127.0.0.1", $usuario, $password, { pg_enable_utf8 => 1 })
or die "No se pudo conectar a PostgreSQL: " . $DBI::errstr;

my $ar_pg = $dbh_pg->selectall_arrayref('SELECT film_id, title FROM film LIMIT 10');

say "Primeras 10 películas en PostgreSQL: " . Dumper $ar_pg;

$dbh_pg->disconnect;

## ejemplo con MySQL

my $dbh_mysql = DBI->connect("dbi:mysql:database=sakila;host=127.0.0.1", $usuario, $password, { mysql_enable_utf8 => 1 })
or die "No se pudo conectar a MySQL: " . $DBI::errstr;

my $ar_mysql = $dbh_mysql->selectall_arrayref('SELECT film_id, title FROM film LIMIT 10');

say "Primeras 10 películas en MySQL: " . Dumper $ar_pg;

$dbh_mysql->disconnect;

