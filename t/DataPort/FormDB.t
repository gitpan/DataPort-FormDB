#!perl
#
#
use 5.001;
use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE $FILE);
$VERSION = '0.05';   # automatically generated file
$DATE = '2003/06/23';
$FILE = __FILE__;

use Test::Tech;
use Getopt::Long;
use Cwd;
use File::Spec;
use File::FileUtil;

##### Test Script ####
#
# Name: FormDB.t
#
# UUT: DataPort::FileType::FormDB
#
# The module Test::STDmaker generated this test script from the contents of
#
# t::DataPort::FormDB;
#
# Don't edit this test script file, edit instead
#
# t::DataPort::FormDB;
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
   plan(tests => 12);

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

ok(  my $loaded = $fu->is_package_loaded('DataPort::FileType::FormDB'), # actual results
      '', # expected results
     '',
     'UUT not loaded');

#  ok:  1

   # Perl code from C:
my $errors = $fu->load_package( 'DataPort::FileType::FormDB' );


####
# verifies requirement(s):
# L<DataPort::FileType::FormDB/general [1] - load>
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
# L<DataPort::FileType::FormDB/general [2] - pod check>
# 

#####
ok(  $fu->pod_errors( 'DataPort::FileType::FormDB'), # actual results
     0, # expected results
     '',
     'No pod errors');

#  ok:  3

   # Perl code from C:
    #######
    # Test the lenient format.
    #
    unlink 'FormDBa1.tdb';
    unlink 'FormDBr1.txt';
    unlink 'FormDBa1.txt';

    my $dbh_in = new DataPort::FileType::FormDB(flag=>'<', file=>'FormDB0.tdb');
    my $dbh_out = new DataPort::FileType::FormDB(flag=>'>', file=>'FormDBa1.tdb');

    my ($record,$fields) = ('','');
    my ($$record_p, $$fields_p) = (\$record,\$fields);

    my $array_p = [];
    while( $dbh_in->get_record($record_p) ) {
        $dbh_in->decode_record($record_p,$fields_p);
        $fu->fout( 'FormDBr1.txt',$$fields_p . "\n~-~\n", {append=>1} );
        $dbh_in->decode_field($fields_p, $array_p);
        $fu->fout( 'FormDBa1.txt',join("\n",@$array_p) . "\n~-~\n", {append=>1});
        ($$record_p, $$fields_p) = ('','');
        $dbh_out->encode_field( $array_p, $fields_p );
        $dbh_out->encode_record( $fields_p, $record_p);
        $dbh_out->put_record($record_p);
        ($$record_p, $$fields_p) = ('','');
    }

    $dbh_out->finish();
    $dbh_in->finish();


####
# verifies requirement(s):
#      L<DataPort::FileType::FormDB/format [1] - separator strings>
#      L<DataPort::FileType::FormDB/format [2] - separator escapes>
#      L<DataPort::FileType::FormDB/format [3] - field names>
#      L<DataPort::FileType::FormDB/format [4] - field names>
#      L<DataPort::FileType::FormDB/format [5] - EON>
#      L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
#      L<DataPort::FileType::FormDB/methods [4] - decode_record>
#      L<DataPort::FileType::FormDB/methods [6] - get_record>
#      L<DataPort::FileType::FormDB/methods [7] - get_record>
# 

#####
ok(  $fu->fin('FormDBr1.txt'), # actual results
     $fu->fin('FormDBr2.txt'), # expected results
     '',
     'Lenient Record');

#  ok:  4


####
# verifies requirement(s):
#      L<DataPort::FileType::FormDB/format [1] - separator strings>
#      L<DataPort::FileType::FormDB/format [2] - separator escapes>
#      L<DataPort::FileType::FormDB/format [3] - field names>
#      L<DataPort::FileType::FormDB/format [4] - field names>
#      L<DataPort::FileType::FormDB/format [5] - EON>
#      L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
#      L<DataPort::FileType::FormDB/methods [2] - decode_field>
# 

#####
ok(  $fu->fin('FormDBa1.txt'), # actual results
     $fu->fin('FormDBa2.txt'), # expected results
     '',
     'Lenient Get Array');

#  ok:  5


####
# verifies requirement(s):
#      L<DataPort::FileType::FormDB/format [1] - separator strings>
#      L<DataPort::FileType::FormDB/format [2] - separator escapes>
#      L<DataPort::FileType::FormDB/format [3] - field names>
#      L<DataPort::FileType::FormDB/format [4] - field names>
#      L<DataPort::FileType::FormDB/format [5] - EON>
#      L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
#      L<DataPort::FileType::FormDB/methods [1] - encode_field>
#      L<DataPort::FileType::FormDB/methods [3] - encode_record>
#      L<DataPort::FileType::FormDB/methods [5] - put_record>
# 

#####
ok(  $fu->fin('FormDBa1.tdb'), # actual results
     $fu->fin('FormDBa2.tdb'), # expected results
     '',
     'Lenient Put Array');

#  ok:  6

   # Perl code from C:
    #######
    # Test the strict format.
    #
    unlink 'FormDBa1.tdb';
    unlink 'FormDBr1.txt';
    unlink 'FormDBa1.txt';

    $dbh_in = new DataPort::FileType::FormDB(flag=>'<', file=>'FormDBs0.tdb', strict=>1);
    $dbh_out = new DataPort::FileType::FormDB(flag=>'>', file=>'FormDBa1.tdb', strict=>1);

    ($$record_p, $$fields_p) = ('','');
    while( $dbh_in->get_record($record_p) ) {
        $dbh_in->decode_record($record_p);
        $fu->fout( 'FormDBr1.txt',$$record_p . "\n~-~\n", {append=>1} );
        $dbh_in->decode_field($record_p, $array_p);
        $fu->fout( 'FormDBa1.txt',join("\n",@$array_p) . "\n~-~\n", {append=>1});
        ($$record_p, $$fields_p) = ('','');
        $dbh_out->encode_field( $array_p, $record_p );
        $dbh_out->encode_record($record_p);
        $dbh_out->put_record($record_p);
        ($$record_p, $$fields_p) = ('','');
    }


    $dbh_out->finish();
    $dbh_in->finish();


####
# verifies requirement(s):
#      L<DataPort::FileType::FormDB/format [1] - separator strings>
#      L<DataPort::FileType::FormDB/format [2] - separator escapes>
#      L<DataPort::FileType::FormDB/format [3] - field names>
#      L<DataPort::FileType::FormDB/format [4] - field names>
#      L<DataPort::FileType::FormDB/format [5] - EON>
#      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
#      L<DataPort::FileType::FormDB/methods [4] - decode_record>
#      L<DataPort::FileType::FormDB/methods [6] - get_record>
#      L<DataPort::FileType::FormDB/methods [7] - get_record>
# 

#####
ok(  $fu->fin('FormDBr1.txt'), # actual results
     $fu->fin('FormDBr3.txt'), # expected results
     '',
     'Strict Record');

#  ok:  7


####
# verifies requirement(s):
#      L<DataPort::FileType::FormDB/format [1] - separator strings>
#      L<DataPort::FileType::FormDB/format [2] - separator escapes>
#      L<DataPort::FileType::FormDB/format [3] - field names>
#      L<DataPort::FileType::FormDB/format [4] - field names>
#      L<DataPort::FileType::FormDB/format [5] - EON>
#      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
#      L<DataPort::FileType::FormDB/methods [2] - decode_field>
# 

#####
ok(  $fu->fin('FormDBa1.txt'), # actual results
     $fu->fin('FormDBa3.txt'), # expected results
     '',
     'Strict Get Array');

#  ok:  8


####
# verifies requirement(s):
#      L<DataPort::FileType::FormDB/format [1] - separator strings>
#      L<DataPort::FileType::FormDB/format [2] - separator escapes>
#      L<DataPort::FileType::FormDB/format [3] - field names>
#      L<DataPort::FileType::FormDB/format [4] - field names>
#      L<DataPort::FileType::FormDB/format [5] - EON>
#      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
#      L<DataPort::FileType::FormDB/methods [1] - encode_field>
#      L<DataPort::FileType::FormDB/methods [3] - encode_record>
#      L<DataPort::FileType::FormDB/methods [5] - put_record>
# 

#####
ok(  $fu->fin('FormDBa1.tdb'), # actual results
     $fu->fin('FormDBa3.tdb'), # expected results
     '',
     'Strict Put Array');

#  ok:  9

   # Perl code from C:
    #######
    # Test the strict binary format.
    #
    unlink 'FormDBa1.tdb';
    unlink 'FormDBh1.tdb';
    unlink 'FormDBr1.txt';
    unlink 'FormDBa1.txt';

    $dbh_in = new DataPort::FileType::FormDB(flag=>'<', file=>'FormDBs0.tdb', strict=>1, binary=>1);
    $dbh_out = new DataPort::FileType::FormDB(flag=>'>', file=>'FormDBa1.tdb', strict=>1, binary=>1);

    ($$record_p, $$fields_p) = ('','');
    while( $dbh_in->get_record($record_p) ) {
        $dbh_in->decode_record($record_p, $record_p);
        $fu->fout( 'FormDBr1.txt',$$record_p . "\n~-~\n", {append=>1} );
        $dbh_in->decode_field($record_p, $array_p);
        $fu->fout( 'FormDBa1.txt',join("\n",@$array_p) . "\n~-~\n", {append=>1});
        ($$record_p, $$fields_p) = ('','');
        $dbh_out->encode_field( $array_p, $record_p );
        $dbh_out->encode_record( $record_p, $record_p);
        $dbh_out->put_record($record_p);
        ($$record_p, $$fields_p) = ('','');
    }

    $dbh_out->finish();
    $dbh_in->finish();


####
# verifies requirement(s):
#      L<DataPort::FileType::FormDB/format [1] - separator strings>
#      L<DataPort::FileType::FormDB/format [2] - separator escapes>
#      L<DataPort::FileType::FormDB/format [3] - field names>
#      L<DataPort::FileType::FormDB/format [4] - field names>
#      L<DataPort::FileType::FormDB/format [5] - EON>
#      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
#      L<DataPort::FileType::FormDB/methods [4] - decode_record>
#      L<DataPort::FileType::FormDB/methods [6] - get_record>
#      L<DataPort::FileType::FormDB/methods [7] - get_record>
# 

#####
ok(  $fu->fin('FormDBr1.txt', {binary=>1}), # actual results
     $fu->fin('FormDBr4.txt', {binary=>1}), # expected results
     '',
     'Strict Binary Record');

#  ok:  10


####
# verifies requirement(s):
#      L<DataPort::FileType::FormDB/format [1] - separator strings>
#      L<DataPort::FileType::FormDB/format [2] - separator escapes>
#      L<DataPort::FileType::FormDB/format [3] - field names>
#      L<DataPort::FileType::FormDB/format [4] - field names>
#      L<DataPort::FileType::FormDB/format [5] - EON>
#      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
#      L<DataPort::FileType::FormDB/methods [2] - decode_field>
# 

#####
ok(  $fu->fin('FormDBa1.txt', {binary=>1}), # actual results
     $fu->fin('FormDBa4.txt', {binary=>1}), # expected results
     '',
     'Strict Binary Get Array');

#  ok:  11


####
# verifies requirement(s):
#      L<DataPort::FileType::FormDB/format [1] - separator strings>
#      L<DataPort::FileType::FormDB/format [2] - separator escapes>
#      L<DataPort::FileType::FormDB/format [3] - field names>
#      L<DataPort::FileType::FormDB/format [4] - field names>
#      L<DataPort::FileType::FormDB/format [5] - EON>
#      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
#      L<DataPort::FileType::FormDB/methods [1] - encode_field>
#      L<DataPort::FileType::FormDB/methods [3] - encode_record>
#      L<DataPort::FileType::FormDB/methods [5] - put_record>
# 

#####
ok(  $fu->fin('FormDBa1.tdb', {binary=>1}), # actual results
     $fu->fin('FormDBa4.tdb', {binary=>1}), # expected results
     '',
     'Strict Binary Put Array');

#  ok:  12

   # Perl code from C:
    #######
    # Test the strict binary format.
    #
    unlink 'FormDBa1.tdb';
    unlink 'FormDBh1.tdb';
    unlink 'FormDBr1.txt';
    unlink 'FormDBa1.txt';


=head1 NAME

FormDB.t - test script for DataPort/FileType/FormDB.pm

=head1 SYNOPSIS

 FormDB.t -log=I<string>

=head1 OPTIONS

All options may be abbreviated with enough leading characters
to distinguish it from the other options.

=over 4

=item C<-log>

FormDB.t uses this option to redirect the test results 
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

=for html
<hr>
<p><br>
<!-- BLK ID="NOTICE" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="OPT-IN" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="EMAIL" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="LOG_CGI" -->
<!-- /BLK -->
<p><br>

=cut

## end of test script file ##

