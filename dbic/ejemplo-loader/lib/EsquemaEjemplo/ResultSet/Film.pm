use utf8;
package EsquemaEjemplo::ResultSet::Film;

use parent DBIx::Class::ResultSet;

sub listar_inventarios {
  my $self = shift; # $self es equivalente aca a $schema->resultset('Film')
  my %condiciones = @_ if @_;

  return $self->search( \%condiciones, {
    select => [ 'me.film_id', 'title', { count => 'inventories.film_id', -as => 'total' } ],
    join => [ 'inventories' ],
    group_by => [ 'me.film_id', 'title' ],
    order_by => [ 'total DESC' ],
  });
}

1;