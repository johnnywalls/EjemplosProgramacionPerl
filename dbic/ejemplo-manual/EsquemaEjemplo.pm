package EsquemaEjemplo;
use base qw/DBIx::Class::Schema/;

use utf8;

# cargar los módulos EsquemaEjemplo::Result::* y sus clases resultset
# si las hubiese
__PACKAGE__->load_namespaces();

1;