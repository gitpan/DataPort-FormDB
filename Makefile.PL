
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

my $tests = join ' ',unix2os('t/DataPort/FormDB.t');
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
    VERSION  => '0.05',
    dist     => {COMPRESS => 'gzip',
                'gz' => 'gz'},
    test     => {TESTS => $tests},
    PREREQ_PM => {'Test::Tech' => 1.08,
'Test::STD::Scrub' => 1.07,
'File::FileUtil' => 1.09,
'DataPort::DataFile' => 0,},
    EXE_FILES => $exe,

    ($] >= 5.005 ?     
        (AUTHOR    => 'SoftwareDiamonds.com E<lt>support@SoftwareDiamonds.comE<gt>',
        ABSTRACT  => 'Text Form Database with advantages over CSV that has text separation
sequences with very simple escapes so the separation sequences never
appear in the data. The text file resembles very closely hard copy
forms.', ) : ()),
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

