#!perl
#
#
use 5.001;
use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE $FILE);
$VERSION = '0.04';   # automatically generated file
$DATE = '2003/06/21';
$FILE = __FILE__;

use Test::Tech;
use Getopt::Long;
use Cwd;
use File::Spec;
use File::FileUtil;

##### Test Script ####
#
# Name: DataFile.t
#
# UUT: DataPort::DataFile
#
# The module Test::STDmaker generated this test script from the contents of
#
# DataPort::DataFile::DataFile;
#
# Don't edit this test script file, edit instead
#
# DataPort::DataFile::DataFile;
#
#	ANY CHANGES MADE HERE TO THIS SCRIPT FILE WILL BE LOST
#
#       the next time Test::STDmaker generates this script file.
#
#

######
#
# T:
#
# use a BEGIN block so we print our plan before Module Under Test is loaded
#
BEGIN { 
   use vars qw( $__restore_dir__ @__restore_inc__);

   ########
   # Working directory is that of the script file
   #
   $__restore_dir__ = cwd();
   my ($vol, $dirs, undef) = File::Spec->splitpath( __FILE__ );
   chdir $vol if $vol;
   chdir $dirs if $dirs;

   #######
   # Add the library of the unit under test (UUT) to @INC
   #
   @__restore_inc__ = File::FileUtil->test_lib2inc();

   unshift @INC, File::Spec->catdir( cwd(), 'lib' ); 

   ##########
   # Pick up a output redirection file and tests to skip
   # from the command line.
   #
   my $test_log = '';
   GetOptions('log=s' => \$test_log);

   ########
   # Create the test plan by supplying the number of tests
   # and the todo tests
   #
   require Test::Tech;
   Test::Tech->import( qw(plan ok skip skip_tests tech_config) );
   plan(tests => 10);

}



END {

   #########
   # Restore working directory and @INC back to when enter script
   #
   @INC = @__restore_inc__;
   chdir $__restore_dir__;
}

   # Perl code from C:
    use File::FileUtil;
    my $fu = 'File::FileUtil';

ok(  my $loaded = $fu->is_package_loaded('DataPort::DataFileI'), # actual results
      '', # expected results
     '',
     'UUT not loaded');

#  ok:  1

   # Perl code from C:
my $errors = $fu->load_package( 'DataPort::DataFileI' );


####
# verifies requirement(s):
# L<DataPort::DataFile/general [1] - load>
# 

#####
skip_tests( 1 ) unless skip(
      $loaded, # condition to skip test   
      $errors, # actual results
      '',  # expected results
      '',
      'Load UUT');
 
#  ok:  2


####
# verifies requirement(s):
# L<DataPort::DataFile/general [2] - pod check>
# 

#####
ok(  $fu->pod_errors( 'DataPort::DataFile'), # actual results
     0, # expected results
     '',
     'No pod errors');

#  ok:  3

   # Perl code from C:
    unlink 'DataFile1.txt';

    my $record;
    my ($array_p, $record_p) = ([], \$record);
    my $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
               option1 => '1', option2 => '2' );

    while( $dbh->get($array_p, $record_p) ) {
        $fu->fout( 'DataFile1.txt', $$record_p . "\n~-~\n", {append=>1});
        $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~-~\n", {append=>1});
    };

ok(  $fu->fin('DataFile1.txt'), # actual results
     $fu->fin('DataFile2.txt'), # expected results
     '',
     'get with record');

#  ok:  4

   # Perl code from C:
    unlink 'DataFile1.txt';
    $dbh->finish();

    $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
               option3 => '3', option4 => '4',  option5 => '5' );

    while( $dbh->get($array_p) ) {
        $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~-~\n", {append=>1});
    }
    $dbh->finish();

ok(  $fu->fin('DataFile1.txt'), # actual results
     $fu->fin('DataFile3.txt'), # expected results
     '',
     'get without record');

#  ok:  5

   # Perl code from C:
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '>', file => 'DataFile1.tdb',
               option6 => '6', option7 => '7' );

    my @db = ( [ 'name1','data1','name2','data2'], [ 'name3', 'data3', 'name4', 'data4' ] );  
 
    foreach $array_p (@db) {
        $record = ''; 
        $dbh->put($array_p, $record_p);
        $fu->fout('DataFile1.txt', $$record_p . "\n~-~\n", {append=>1});
    }
    $dbh->finish();

ok(  $fu->fin('DataFile1.tdb'), # actual results
     $fu->fin('DataFile2.tdb'), # expected results
     '',
     'put with record');

#  ok:  6

ok(  $fu->fin('DataFile1.txt'), # actual results
     $fu->fin('DataFile4.txt'), # expected results
     '',
     'put with record');

#  ok:  7

   # Perl code from C:
    $dbh->finish();
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '>', file => 'DataFile1.tdb',
               option8 => '8' );

    @db = ( [ 'name5','data5','name6','data6'], [ 'name7', 'data7' ] );  
 
    foreach $array_p (@db) { 
        $dbh->put($array_p);
    }
    $dbh->finish();

ok(  $fu->fin('DataFile1.tdb'), # actual results
     $fu->fin('DataFile3.tdb'), # expected results
     '',
     'put with without record');

#  ok:  8

   # Perl code from C:
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '>', file => 'DataFile1.tdb',
              binary => 1, option9 => '9' );

    @db = ( [ 'name5','data5','name6','data6'], [ 'name7', 'data7' ] );  
 
    foreach $array_p (@db) { 
        $dbh->put($array_p);
    }
    $dbh->finish();

ok(  $fu->fin('DataFile1.tdb'), # actual results
     $fu->fin('DataFile4.tdb'), # expected results
     '',
     'binary put with without record');

#  ok:  9

   # Perl code from C:
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
               binary => 1, option10 => '10', option11 => '11' );

    while( $dbh->get($array_p, $record_p) ) {
        $fu->fout( 'DataFile1.txt', $$record_p . "\n~-~\n", {append=>1});
        $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~-~\n", {append=>1});
    }
    $dbh->finish();

ok(  $fu->fin('DataFile1.txt'), # actual results
     $fu->fin('DataFile5.txt'), # expected results
     '',
     'binary get with record');

#  ok:  10

   # Perl code from C:
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';


=head1 NAME

DataFile.t - test script for DataPort::DataFile

=head1 SYNOPSIS

 DataFile.t -log=I<string>

=head1 OPTIONS

All options may be abbreviated with enough leading characters
to distinguish it from the other options.

=over 4

=item C<-log>

DataFile.t uses this option to redirect the test results 
from the standard output to a log file.

=back

=head1 COPYRIGHT

copyright © 2003 Software Diamonds.

Software Diamonds permits the redistribution
and use in source and binary forms, with or
without modification, provided that the 
following conditions are met: 

=over 4

=item 1

Redistributions of source code, modified or unmodified
must retain the above copyright notice, this list of
conditions and the following disclaimer. 

=item 2

Redistributions in binary form must 
reproduce the above copyright notice,
this list of conditions and the following 
disclaimer in the documentation and/or
other materials provided with the
distribution.

=back

SOFTWARE DIAMONDS, http://www.SoftwareDiamonds.com,
PROVIDES THIS SOFTWARE 
'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL SOFTWARE DIAMONDS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL,EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE,DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING USE OF THIS SOFTWARE, EVEN IF
ADVISED OF NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE POSSIBILITY OF SUCH DAMAGE.

=cut

## end of test script file ##

