package CursoPerl::Ejemplos::Ocurrencias;

use v5.16;
use strict;
use warnings FATAL => 'all';
use utf8::all;

use Getopt::Long;

=head1 NAME

CursoPerl::Ejemplos::Ocurrencias - The great new CursoPerl::Ejemplos::Ocurrencias!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Contar ocurrencias de palabras en archivo de texto plano

    use CursoPerl::Ejemplos::Ocurrencias;

    CursoPerl::Ejemplos::Ocurrencias->contar_ocurrencias( ARCHIVO => '/ruta/archivo.txt ');
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 contar_ocurrencias

Contar ocurrencias de palabras dentro de un archivo de texto plano.
Puede recibir los parámetros:

=over

=item *

B<ARCHIVO>: Ruta a archivo de texto plano para analizar. Obligatorio

=item *

B<REPETICIONES>: Mostrar sólo palabras que tengan al menos esta
cantidad de repeticiones

=item *

B<BUSCAR \@>: Lista de palabras a buscar

=item *

B<DEBUG>: Mostrar información adicional

=back

=cut

sub contar_ocurrencias {
  my %opciones = (
    DEBUG => 0,
    REPETICIONES => 1,
    @_
  );
  die "ARCHIVO no especificado" unless $opciones{ARCHIVO};

  use File::Basename qw/ basename dirname /;

  my $archivo = $opciones{ARCHIVO};
  my $repeticiones = $opciones{REPETICIONES};
  my @buscar = @{ $opciones{BUSCAR} } if exists $opciones{BUSCAR} && ref($opciones{BUSCAR}) eq 'ARRAY';
  my $debug = $opciones{DEBUG};

  # tenemos acceso a la rutina GetOptions exportada de manera predeterminada
  # por Getopt::Long
  GetOptions ("repeticiones=i" => \$repeticiones,  # entero
              "archivo=s"      => \$archivo,       # cadena
              "buscar=s"       => \@buscar,        # lista de cadenas
              "debug"          => \$debug)         # flag/logico
  or die("Error en los parámetros del comando\n");

  my $nombre_archivo = basename( $archivo );
  my $directorio_archivo = dirname( $archivo );

  open (ARCHIVO, '<', $archivo)
      or die "No pude abrir el archivo $archivo: $!";

  my %ocurrencias;
  my ($nlineas,$npalabras);
  while (<ARCHIVO>) {
    chomp;
    $nlineas++ if $debug;
    my @palabras = ( $_ =~ m/(\p{IsAlpha}+)/g );
    $npalabras = scalar @palabras if $debug;
    foreach my $palabra (@palabras) {
      if ( scalar(@buscar) == 0 || $palabra ~~ @buscar ) {
        $ocurrencias{ fc($palabra) }++;
      }
    }
  }
  close ARCHIVO;

  if ( $debug ) {
    say "Procesado $nombre_archivo (ubicado en directorio $directorio_archivo)";
    say "con $nlineas lineas y $npalabras palabras en total";
  }

  foreach my $palabra ( sort { $ocurrencias{$b} <=> $ocurrencias{$a} } keys %ocurrencias ) {
    say "'$palabra' aparece $ocurrencias{$palabra} veces" if $ocurrencias{$palabra} >= $repeticiones;
  }
}

=head1 AUTHOR

Programador Perl, C<< <programador at example.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-cursoperl-ejemplos-ocurrencias at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=CursoPerl-Ejemplos-Ocurrencias>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc CursoPerl::Ejemplos::Ocurrencias


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=CursoPerl-Ejemplos-Ocurrencias>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/CursoPerl-Ejemplos-Ocurrencias>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/CursoPerl-Ejemplos-Ocurrencias>

=item * Search CPAN

L<http://search.cpan.org/dist/CursoPerl-Ejemplos-Ocurrencias/>

=back


=head1 ACKNOWLEDGEMENTS

Gracias a Module::Starter

=head1 LICENSE AND COPYRIGHT

Copyright 2014 Programador Perl.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; version 2 dated June, 1991 or at your option
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

A copy of the GNU General Public License is available in the source tree;
if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA


=cut

1; # End of CursoPerl::Ejemplos::Ocurrencias
