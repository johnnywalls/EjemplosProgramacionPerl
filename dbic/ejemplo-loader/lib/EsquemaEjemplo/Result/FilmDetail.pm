use utf8;
package EsquemaEjemplo::Result::FilmDetail;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EsquemaEjemplo::Result::FilmDetail

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

=head1 TABLE: C<film_detail>

=cut

__PACKAGE__->table("film_detail");

=head1 ACCESSORS

=head2 film_id

  data_type: 'integer'
  is_nullable: 1

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 release_year

  data_type: 'year'
  is_nullable: 1
  size: 4

=head2 language_id

  data_type: 'smallint'
  is_nullable: 1

=head2 rental_duration

  data_type: 'smallint'
  is_nullable: 1

=head2 rental_rate

  data_type: 'numeric'
  is_nullable: 1
  size: [4,2]

=head2 length

  data_type: 'smallint'
  is_nullable: 1

=head2 rating

  data_type: 'enum'
  extra: {custom_type_name => "mpaa_rating",list => ["G","PG","PG-13","R","NC-17"]}
  is_nullable: 1

=head2 language_name

  data_type: 'char'
  is_nullable: 1
  size: 20

=head2 actors

  data_type: 'text'
  is_nullable: 1

=head2 categories

  data_type: 'text'
  is_nullable: 1

=head2 inventories

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "film_id",
  { data_type => "integer", is_nullable => 1 },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "release_year",
  { data_type => "year", is_nullable => 1, size => 4 },
  "language_id",
  { data_type => "smallint", is_nullable => 1 },
  "rental_duration",
  { data_type => "smallint", is_nullable => 1 },
  "rental_rate",
  { data_type => "numeric", is_nullable => 1, size => [4, 2] },
  "length",
  { data_type => "smallint", is_nullable => 1 },
  "rating",
  {
    data_type => "enum",
    extra => {
      custom_type_name => "mpaa_rating",
      list => ["G", "PG", "PG-13", "R", "NC-17"],
    },
    is_nullable => 1,
  },
  "language_name",
  { data_type => "char", is_nullable => 1, size => 20 },
  "actors",
  { data_type => "text", is_nullable => 1 },
  "categories",
  { data_type => "text", is_nullable => 1 },
  "inventories",
  { data_type => "text", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-12 13:04:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xL/XNRDTtDf3523S3HbcYg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
