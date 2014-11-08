#!/usr/bin/env perl

use strict;
use warnings;
use utf8::all;
use v5.14;

# Comúnmente tenemos un paquete por archivo, y podemos especificar
# package MiPaquete;
#
# Aquí vamos a encerrar los paquetes como bloques para ilustrar
# el uso de varios paquetes en un mismo programa/archivo

package Springfield {
  our $VERSION = 1.23;
  my $alcalde = 'Quimby';
  our $policia = 'Wiggum';

  sub nombre {
    say "Qué bonita es " . __PACKAGE__;
  }
}

# de ser un archivo separado, este paquete estaria en
# Springfield/PlantaNuclear/SalaControl.pm
package Springfield::PlantaNuclear::SalaControl v0.9.1 {
  our $operador = 'Homero';

  sub nombre {
    say "Hay muchos botones en " . __PACKAGE__ . ' versión ' . __PACKAGE__->VERSION();
  }
  sub alarma {
    say "$operador dice: '¡Alerta! Llamen a " . $Springfield::policia . "'";
  }
}


say "Estamos en Springfield versión " . Springfield->VERSION();
Springfield::nombre();

Springfield::PlantaNuclear::SalaControl::nombre();

if ( $Springfield::PlantaNuclear::SalaControl::operador eq 'Homero' ) {
  Springfield::PlantaNuclear::SalaControl::alarma();
}

say "Nuestro alcalde es " . $Springfield::alcalde; # mal, $alcalde es privada al paquete
say "Nuestro policia es " . $Springfield::policia; # tenemos acceso a $policia gracias a our

# fuera de cualquier paquete, o antes de declarar alguno,
# nos encontramos en el paquete main,
# como si hubiesemos declarado
# package main
say "El paquete actual es " . __PACKAGE__;

# si pasamos un argumento a VERSION(), Perl intentará validar que tenemos
# una versión igual o superior de dicho paquete, y "morirá" de lo contrario
Springfield::PlantaNuclear::SalaControl->VERSION(1.5);
say "Este mensaje será ignorado";