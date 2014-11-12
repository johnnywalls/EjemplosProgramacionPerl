package EsquemaEjemplo::Result::Actor;
use base qw/DBIx::Class::Core/;

__PACKAGE__->load_components(qw/ InflateColumn::DateTime /);

__PACKAGE__->table('actor');

__PACKAGE__->add_columns(qw/ actor_id first_name last_name /);

__PACKAGE__->add_columns(
  last_update, {
    data_type => "timestamp",
  }
);

__PACKAGE__->set_primary_key('actor_id');

1;