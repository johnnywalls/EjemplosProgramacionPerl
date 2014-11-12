use utf8;
package EsquemaEjemplo::Result::ActorInfo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

EsquemaEjemplo::Result::ActorInfo

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

=head1 TABLE: C<actor_info>

=cut

__PACKAGE__->table("actor_info");

=head1 ACCESSORS

=head2 actor_id

  data_type: 'integer'
  is_nullable: 1

=head2 first_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 last_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 film_info

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "actor_id",
  { data_type => "integer", is_nullable => 1 },
  "first_name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "last_name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "film_info",
  { data_type => "text", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-12 13:04:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VCJtiTyqFCU4ZjaPdwt4RQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
