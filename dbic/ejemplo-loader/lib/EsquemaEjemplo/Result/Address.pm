use utf8;
package EsquemaEjemplo::Result::Address;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EsquemaEjemplo::Result::Address

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

=head1 TABLE: C<address>

=cut

__PACKAGE__->table("address");

=head1 ACCESSORS

=head2 address_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'address_address_id_seq'

=head2 address

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 address2

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 district

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 city_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 postal_code

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 phone

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "address_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "address_address_id_seq",
  },
  "address",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "address2",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "district",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "city_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "postal_code",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "phone",
  { data_type => "varchar", is_nullable => 0, size => 20 },
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

=item * L</address_id>

=back

=cut

__PACKAGE__->set_primary_key("address_id");

=head1 RELATIONS

=head2 city

Type: belongs_to

Related object: L<EsquemaEjemplo::Result::City>

=cut

__PACKAGE__->belongs_to(
  "city",
  "EsquemaEjemplo::Result::City",
  { city_id => "city_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 customers

Type: has_many

Related object: L<EsquemaEjemplo::Result::Customer>

=cut

__PACKAGE__->has_many(
  "customers",
  "EsquemaEjemplo::Result::Customer",
  { "foreign.address_id" => "self.address_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 staffs

Type: has_many

Related object: L<EsquemaEjemplo::Result::Staff>

=cut

__PACKAGE__->has_many(
  "staffs",
  "EsquemaEjemplo::Result::Staff",
  { "foreign.address_id" => "self.address_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stores

Type: has_many

Related object: L<EsquemaEjemplo::Result::Store>

=cut

__PACKAGE__->has_many(
  "stores",
  "EsquemaEjemplo::Result::Store",
  { "foreign.address_id" => "self.address_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-12 13:04:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:827NvAkjx9swBxkjerGR3g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
