use utf8;
package EsquemaEjemplo::Result::Inventory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EsquemaEjemplo::Result::Inventory

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

=head1 TABLE: C<inventory>

=cut

__PACKAGE__->table("inventory");

=head1 ACCESSORS

=head2 inventory_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'inventory_inventory_id_seq'

=head2 film_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 store_id

  data_type: 'smallint'
  is_nullable: 0

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "inventory_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "inventory_inventory_id_seq",
  },
  "film_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "store_id",
  { data_type => "smallint", is_nullable => 0 },
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

=item * L</inventory_id>

=back

=cut

__PACKAGE__->set_primary_key("inventory_id");

=head1 RELATIONS

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

=head2 rentals

Type: has_many

Related object: L<EsquemaEjemplo::Result::Rental>

=cut

__PACKAGE__->has_many(
  "rentals",
  "EsquemaEjemplo::Result::Rental",
  { "foreign.inventory_id" => "self.inventory_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-12 13:04:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OtZEwC4H/Gqc/EEiyv5TmQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
