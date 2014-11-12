use utf8;
package EsquemaEjemplo::ResultSet::Payment;

use parent DBIx::Class::ResultSet;

sub listar_pagos_rango_fecha {
  my $self = shift; # $self es equivalente aca a $schema->resultset('Film')
  my ( $inicio, $fin ) = @_;

  die "Debe especificar el inicio y fin del rango de fecha" unless ( $inicio && $fin );

  return $self->search({
    amount => { '>=' => 5 },
    payment_date => { -between => [ $inicio, $fin ] }
  }, {
    prefetch => [ 'customer', 'staff' ]
  });
}

1;