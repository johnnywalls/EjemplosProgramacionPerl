#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.16;

use Data::Dumper;

package Simpsons::Personaje v0.0.1 {
  our $ciudad = 'Springfield'; # atributo compartido de clase

  sub new {
    my $clase = shift; # el primer argumento es una referencia a la clase
    my %params = @_ if @_; # utilizamos la convención de parámetros con nombre
    my $objeto = {};
    $objeto->{ color } = $params{ color } // 'Amarillo';
    $objeto->{ apellido } = $params{ color } // 'Simpson';
    $objeto->{ nombre } = $params{ nombre } if exists $params{ nombre };
    return bless $objeto, $clase;
  }

  # ejemplo de rutina 'primitiva' de acceso a datos
  sub nombre {
    my $self = shift;
    my $nuevo_valor = shift if @_;
    # comunmente haremos una validación con los datos, p.ej:
    if ( $nuevo_valor ) {
      $nuevo_valor =~ m/\A[\p{IsAlpha}\p{IsSpace}]+\z/ or die "Valor inválido de nombre";
      $self->{ nombre } = $nuevo_valor;
    }
    return $self->{ nombre } // 'Sin Nombre';
  }

  # en otras subrutinas se puede acceder a atributos internos,
  # invocar otras subrutinas...
  sub hablar {
    my $self = shift;
    my $dialogo = shift if @_;
    die "No puedo hablar sin mi libreto!" unless $dialogo;
    say "'" . $self->nombre() . " $self->{apellido}' dice: $dialogo";
  }

  # Opcionalmente, podemos implementar un método "Destructor"
  # que se invoca cuando ya no hay más referencias al objeto
  sub DESTROY {
    my $self = shift;
    $self->hablar( 'Adiós mundo cruel!!!' );
  }
}

# En caso de tener la definición de clase en un archivo separado, podríamos utilizar:
# use Simpsons::Personaje;

my $bart = Simpsons::Personaje->new( nombre => 'Bart' );

say "\$bart es un objeto de tipo " . ref($bart);
say Dumper($bart);

# podemos acceder a los datos internos del objeto, aunque
# lo recomendado es utilizar metodos de acceso
say "Mi nombre es $bart->{nombre} y soy de color $bart->{color}";

my $anonimo = Simpsons::Personaje->new;
say $anonimo->nombre;
$anonimo->nombre( 'Milhouse' );
say "Ahora me llamo " . $anonimo->nombre;

$bart->hablar('¡Yo no fui!');

# podemos utilizar la funcionalidad de UNIVERSAL. Por ejemplo:
$bart->hablar('Pero te digo que ¡Yo no fui!') unless $bart->can('escapar');

say 'Todos vivimos en ' . $Simpsons::Personaje::ciudad;



