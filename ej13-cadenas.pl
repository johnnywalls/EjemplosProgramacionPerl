#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

# Podemos identificar de manera sencilla la posicion de una
# subcadena en otra (si de hecho la contiene)
             #        10        20        30        40
             #12345678901234567890123456789012345678901234
my $cadena = 'Tres tristes tigres comen trigo en el trigal';
say index( $cadena, 'tri' );
say index( $cadena, 'tri', 10 );
say rindex( $cadena, 'tri' );
say index( $cadena, 'xx' );

# Y podemos extraer subcadenas segun una posicion dada
say substr( $cadena, 5 );
say substr( $cadena, 5, 6 );
say substr( $cadena, rindex( $cadena, 'tri' ) );
# incluso utilizar substr como un 'lvalue' (lado izquierdo de la asignacion)
substr( $cadena, 0, 4 ) = 'Veinte';
say $cadena;

my $ruta = '/mi/ruta/a/un/archivo.txt';
say substr( $ruta, rindex( $ruta, '/' ) + 1 );

# printf imprime una salida formateada. sprintf la devuelve como cadena
say sprintf( "%4d-%02d-%02d %02d:%02d", 2020, 5, 1, 3, 42 );

# solo como ejemplo.  Existen modulos de CPAN optimizados para estas tareas ;)
sub formatear_monto {
  my $numero = sprintf "%.02f", shift;
  my $moneda = shift if @_;
  $moneda //= '$'; # valor predeterminado
  # Agrega un punto cada vez, a través del ciclo while sin cuerpo
  1 while $numero =~ s/^(-?\d+)(\d{3})/$1.$2/;
  substr( $numero, rindex( $numero, '.' ), 1 ) = ',';
  $numero .= " $moneda";
}

say formatear_monto 4562123.4;
say formatear_monto -1234;
say formatear_monto( 998877.66, 'EUR' );

sub formatear_monto_v2 {
  my $numero = shift;
  my $moneda = shift if @_;
  $moneda //= '$'; # valor predeterminado

  use Number::Format;
  my $formato = new Number::Format(-thousands_sep   => '.',
                                   -decimal_point   => ',' );
  return $formato->format_number($numero, 2, 1) . " $moneda";
}
say formatear_monto_v2 4562123.4;
say formatear_monto_v2 -1234;
say formatear_monto_v2( 998877.66, 'EUR' );
