#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my $n;

sub hola_enfermera {
  $n++;    # Variable global $n
  say "Hola, enfermera $n!";
}

# diferentes modos de invocar
hola_enfermera;
hola_enfermera();
&hola_enfermera;

# mayor entre dos numeros
sub maximo {
  my ( $v1, $v2 ) = @_; # asignamos variables con nombre a los parametros
  ( $v1 > $v2 ) ? $v1 : $v2;
}

say maximo(3, 5);
say maximo 10, 20;

# tambien podemos usar directamente los parametros
# $_[0] es el primer elemento de la lista @_, y asi sucesivamente
sub maximo_v2 {
  ( $_[0] > $_[1] ) ? $_[0] : $_[1];
}

say maximo_v2( 45, 42 );

# No tenemos limites en el numero de parametros que podemos recibir
sub maximo_v3 {
  my $v1 = shift;  # equivalente a shift @_
  my $v2 = shift;
  my $v3 = shift if @_; # podemos verificar si quedan valores en la lista
  my $maximo = ( $v1 > $v2 ) ? $v1 : $v2;
  if ( defined $v3 ) {
    $maximo = ( $maximo > $v3 ) ? $maximo : $v3;
  }
  return $maximo;
}

say maximo_v3( 3, 7 );
say maximo_v3( 3, 10, 7);

# una mejor implementacion, ajustandose al numero variable de parametros
sub mejor_maximo {
  my ($maximo) = shift @_;    # tomo el primer valor como el mayor
  foreach (@_) {
    if ($_ > $maximo) {
      $maximo = $_;
    }
  }
  return $maximo;
}
say mejor_maximo( 1..30 );

# notese que el valor de los parametros escalares
# se copia cuando utilizamos variables lexicas
# (paso por valor y no por referencia)
sub modifica {
  my $p = shift;
  $p++;
  say "Dentro de la subrutina: $p";
}
say "Antes de la llamada: $n";
modifica $n;
say "Despues de la llamada: $n";

# pero si accedemos directamente a la lista de parametros,
# modificamos los valores originales
sub modifica2 {
  $_[0]++;
  say "Dentro de la subrutina: $_[0]";
}
say "Antes de la llamada: $n";
modifica2 $n;
say "Despues de la llamada: $n";

# podemos retornar listas, no solo valores escalares
# (luego, con referencias, veremos una manera mas eficiente)
sub rango_inverso {
  reverse $_[0]..$_[1];
}

my @l1 = rango_inverso(1, 10);
say "@l1";
my $r1 = rango_inverso(1, 10); # notese que aqui aplica el contexto escalar
say "$r1";

# podemos preguntar por el contexto de la llamada
sub rango_inverso_v2 {
  wantarray ? reverse $_[0]..$_[1] : $_[1]-$_[0]+1;
}
my @l2 = rango_inverso_v2(1, 10);
say "@l2";
my $r2 = rango_inverso_v2(1, 10);
say "$r2";

# podemos tener variables privadas 'persistentes' entre llamadas a la subrutina
# volvamos a nuestro ejemplo inicial, ahora con 'state' (perl 5.10+)
sub hola_enfermera_v2 {
  state $llamadas; # en lugar de my $llamadas;
  $llamadas++;
  say "Hola enfermera $llamadas!";
}

hola_enfermera_v2;
hola_enfermera_v2;
hola_enfermera_v2;

# otro ejemplo
suma_acumulada(5, 6);
suma_acumulada(1..3);
suma_acumulada( 4 );

sub suma_acumulada {
  state $suma = 0;
  state @numeros;

  foreach my $n (@_){
      push @numeros, $n;
      $suma += $n; 
  }
  say "La suma de (@numeros) es $suma";
}

# podemos usar un 'truco' para tener parametros con nombre en lugar
# de recordar la posicion: asignar la lista de parametros a un hash
configurar( PASSWORD => 'superclave', CPU => 2 );
configurar( PASSWORD => '123', DEBUG => 1 );

sub configurar {
  my %opciones = @_;
  $opciones{CPU} //= 1; # valor predeterminado si no se pasa como parametro
  say "x" x 20;
  say "Configurar con password: $opciones{PASSWORD}" if $opciones{PASSWORD};
  say "Agregar $opciones{CPU} procesador(es)";
  say "Nivel de depuracion" if $opciones{DEBUG};
}

# o de una manera mas elegante

sub configurar_v2 {
  my %opciones = (
    CPU => 1,
    RAM => '4 Gb',  # y asi con demas valores predeterminados
    @_
  ); # al colocar @_ al final, los argumentos dados sobrescriben los predeterminados
  say "x" x 20;
  say "Configurar con password: $opciones{PASSWORD}" if $opciones{PASSWORD};
  say "Agregar $opciones{CPU} procesador(es)";
  say "Nivel de depuracion" if $opciones{DEBUG};
  say "Agregar $opciones{RAM} de memoria RAM";
}

configurar_v2( PASSWORD => 'superclave' );
configurar_v2( PASSWORD => '123', RAM => '16 Gb', CPU => 8 );
