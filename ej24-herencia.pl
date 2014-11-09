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

package Simpsons::Personaje::TrabajadorPlanta v0.0.1 {
  # acá utilizamos directamente @ISA para colocar
  # las clases en un solo archivo de ejemplo
  # Comúnmente se usaría
  # use parent Simpsons::Personaje;
  our @ISA = ('Simpsons::Personaje');

  # Comúnmente aprovechamos el constructor de la clase padre
  # y agregamos alguna funcionalidad / atributos
  sub new {
    my $class = shift;
    my $objeto = $class->SUPER::new(@_);
    my %params = @_;
    $objeto->{ departamento } = $params{ departamento } if exists $params{ departamento };
    return bless( $objeto, $class );
  }

  # podemos redefinir subrutinas...
  sub hablar {
    my $self = shift;
    print 'Desde la planta nuclear... ';
    $self->SUPER::hablar( @_ );
  }

  sub DESTROY {
    my $self = shift;
    $self->hablar( 'Corran! La planta estalla!' );
    $self->SUPER::DESTROY;
  }
}

my $homero = Simpsons::Personaje::TrabajadorPlanta->new(
  nombre => 'Homero',
  departamento => 'Sala de Control',
);

$homero->hablar( 'Mi nombre es ' . $homero->nombre . ' y trabajo en ' . $homero->{departamento} );

say "\$homero es un " . ref($homero);
say "pero también un Simpsons::Personaje" if $homero->isa( 'Simpsons::Personaje' );
