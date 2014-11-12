use utf8;
package EsquemaEjemplo::Result::FilmsSearch;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EsquemaEjemplo::Result::FilmsSearch

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

=head1 TABLE: C<films_search>

=cut

__PACKAGE__->table("films_search");

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

=head2 actors

  data_type: 'text'
  is_nullable: 1

=head2 categories

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
  "actors",
  { data_type => "text", is_nullable => 1 },
  "categories",
  { data_type => "text", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-12 13:04:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:al4CLpnAv898YosCr0AhVw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
