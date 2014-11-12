use utf8;
package EsquemaEjemplo::Result::SaleByStore;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EsquemaEjemplo::Result::SaleByStore

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
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<sales_by_store>

=cut

__PACKAGE__->table("sales_by_store");

=head1 ACCESSORS

=head2 store

  data_type: 'text'
  is_nullable: 1

=head2 manager

  data_type: 'text'
  is_nullable: 1

=head2 total_sales

  data_type: 'numeric'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "store",
  { data_type => "text", is_nullable => 1 },
  "manager",
  { data_type => "text", is_nullable => 1 },
  "total_sales",
  { data_type => "numeric", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-12 13:04:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ekgrUcBr4mgx673uNFPg3w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
