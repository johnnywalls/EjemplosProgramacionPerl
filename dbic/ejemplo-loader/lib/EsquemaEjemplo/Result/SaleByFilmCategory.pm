use utf8;
package EsquemaEjemplo::Result::SaleByFilmCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EsquemaEjemplo::Result::SaleByFilmCategory

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

=head1 TABLE: C<sales_by_film_category>

=cut

__PACKAGE__->table("sales_by_film_category");

=head1 ACCESSORS

=head2 category

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 total_sales

  data_type: 'numeric'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "category",
  { data_type => "varchar", is_nullable => 1, size => 25 },
  "total_sales",
  { data_type => "numeric", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-12 13:04:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:P9H4XY6jCQaihEHH6Gbumw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
