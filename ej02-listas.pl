#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my @nombres = ('Hugo', 'Paco', 'Luis');
say "Somos @nombres";
my @numeros = (1..5);
my $inicio = 100;
my $fin = 110;
my @rango = ( $inicio .. $fin, @numeros ); # usar operador de rango y unir lista
my @lista = ( 1, 'Primero', 2, 'Segundo' );
my @vacia;
my @otra_vacia = ();

use Data::Dumper; #modulo para visualizar estructuras de datos
say Dumper(@lista); # por ahora
say "La lista \@rango contiene: @rango"; #interpolar arreglo en cadena

say "El primer nombre es $nombres[0]";
say "El ultimo es $nombres[-1]";
say "O tambien $nombres[ $#nombres ]";
say 'Hay ' . scalar(@nombres) . ' nombres en total';

# podemos modificar un elemento particular
$nombres[1] = 'Pepe';
# o incluso agregar un indice arbitrario
$nombres[7] = 'Santi';
say 'Y ahora tenemos ' . Dumper(@nombres);

# Al utilizar comillas dobles, debemos escapar @
my $email = "pepe\@example.com";
$email    = 'pepe@example.com';

# Podemos definir una lista de palabras con 'quoted words'
my @palabras = qw( Estas son palabras "individuales" en una lista );
say "palabras:" . Dumper(@palabras);

# o incluso
my @dias = qw /
  Lun
  Mar
/;
say "dias:" . Dumper(@dias);

# podemos utilizar 'slices' o subconjuntos de la lista
@dias[2..4] = qw/Mie Jue Vie/;
say "Trabajamos en @dias, pero salimos temprano los @dias[3..4]";

# Podemos realizar asignacion de listas
my ( $pedro, $pablo, $vilma ) = qw# picapiedra marmol picapiedra #;
my ( $primero, $segundo ) = 1..10; # asignamos los dos primeros, ignoramos el resto

# Algunos operadores de utilidad con listas: pop, push, shift, unshift
my $ultima_palabra = pop @palabras; # extraemos el ultimo elemento
say "La ultima palabra era '$ultima_palabra'. Ahora quedan '@palabras'";

push @palabras, 'sentencia'; # agregamos al final de la lista
say "@palabras";

my $primera_palabra = shift @palabras; # extraer el primer elemento
unshift @palabras, 'Aquellas'; # agregar al principio de la lista
say "@palabras";

# Ciclo sencillo: foreach
my $palabra;
foreach $palabra (@palabras) {
  say $palabra;
}

say "No necesitamos inventar variables si no queremos!!!";
# la variable 'magica': $_
foreach (@palabras) {
  say $_;
}

# podemos invertir la lista con 'reverse'
foreach (reverse 1..10) {
  say $_*2; # y utilizar la variable predeterminada
}

# 'reverse' no modifica la lista original, tendriamos que asignarla
@lista = reverse @lista;

# podemos aplicar una operación a todos los elementos de una lista: map
# en este ejemplo, generamos 10 numeros pseudo-aleatorios del 0 al 99
my @aleatorios = map { int( rand(100) ) } 1..10; # mas de map posteriormente
say "aleatorios: @aleatorios";

# y podemos ordenarlos con sort
my @ordenados = sort @aleatorios;
say "aleatorios ordenados: @ordenados";

# o en reversa
my @en_reversa = reverse sort @aleatorios;
say "aleatorios ordenados en reversa: @en_reversa";

# Para terminar (por ahora), podemos concatenar los elementos de una lista
# con un separador dado para formar una cadena, con 'join'
say join( ',', reverse 1..10 );

