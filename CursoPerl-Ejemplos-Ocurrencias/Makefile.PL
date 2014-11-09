use v5.16;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'CursoPerl::Ejemplos::Ocurrencias',
    AUTHOR           => q{Programador Perl <programador@example.com>},
    VERSION_FROM     => 'lib/CursoPerl/Ejemplos/Ocurrencias.pm',
    ABSTRACT_FROM    => 'lib/CursoPerl/Ejemplos/Ocurrencias.pm',
    LICENSE          => 'GPL_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => v5.16,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'utf8::all' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'CursoPerl-Ejemplos-Ocurrencias-*' },
);
