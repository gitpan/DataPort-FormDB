
####
# 
# The module ExtUtils::STDmaker generated this file from the contents of
#
# Docs::Site_SVD::DataPort_FormDB 
#
# Don't edit this file, edit instead
#
# Docs::Site_SVD::DataPort_FormDB
#
#	ANY CHANGES MADE HERE WILL BE LOST
#
#       the next time ExtUtils::STDmaker generates it.
#
#

use ExtUtils::MakeMaker;

my $tests = join ' ',unix2os('t/DataPort/FormDB.t','t/DataPort/DataFile.t');
my $exe;
if( $exe ) {
  $exe = [join ' ',unix2os($exe)];
}
else {
   $exe = [];
}

WriteMakefile(
    NAME => 'DataPort::FormDB',
    DISTNAME => 'DataPort-FormDB',
    VERSION  => '0.04',
    dist     => {COMPRESS => 'gzip',
                'gz' => 'gz'},
    test     => {TESTS => $tests},
    PREREQ_PM => {'File::FileUtil' => 0,
'Test::Tech' => 0},
    EXE_FILES => $exe,

    ($] >= 5.005 ?     
        (AUTHOR    => 'SoftwareDiamonds.com E<lt>support@SoftwareDiamonds.comE<gt>',
        ABSTRACT  => 'Text Form Datatbase with advantages over CSV that has text separation
sequences with very simple escapes so the separation sequences never
appear in the data.', ) : ()),
);



use File::Spec;
use File::Spec::Unix;
sub unix2os
{
   my @file = ();
   foreach my $file (@_) {
       my (undef, $dir, $file_unix) = File::Spec::Unix->splitpath( $file );
       my @dir = File::Spec::Unix->splitdir( $dir );
       push @file, File::Spec->catfile( @dir, $file_unix);
   }
   @file;
}

