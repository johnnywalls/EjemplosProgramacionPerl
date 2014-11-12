use utf8;
package EsquemaEjemplo::Result::FilmActor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EsquemaEjemplo::Result::FilmActor

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<film_actor>

=cut

__PACKAGE__->table("film_actor");

=head1 ACCESSORS

=head2 actor_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 film_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "actor_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "film_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "last_update",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</actor_id>

=item * L</film_id>

=back

=cut

__PACKAGE__->set_primary_key("actor_id", "film_id");

=head1 RELATIONS

=head2 actor

Type: belongs_to

Related object: L<EsquemaEjemplo::Result::Actor>

=cut

__PACKAGE__->belongs_to(
  "actor",
  "EsquemaEjemplo::Result::Actor",
  { actor_id => "actor_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 film

Type: belongs_to

Related object: L<EsquemaEjemplo::Result::Film>

=cut

__PACKAGE__->belongs_to(
  "film",
  "EsquemaEjemplo::Result::Film",
  { film_id => "film_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-12 13:04:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pIrf8Gf3gZw/gSir/gLuqw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
