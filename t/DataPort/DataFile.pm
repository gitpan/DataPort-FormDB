#!perl
#
# The copyright notice and plain old documentation (POD)
# are at the end of this file.
#
package  t::DataPort::DataFile;

use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE $FILE );
$VERSION = '0.01';
$DATE = '2003/06/21';
$FILE = __FILE__;

########
# The Test::STDmaker module uses the data after the __DATA__ 
# token to automatically generate the this file.
#
# Don't edit anything before __DATA_. Edit instead
# the data after the __DATA__ token.
#
# ANY CHANGES MADE BEFORE the  __DATA__ token WILL BE LOST
#
# the next time Test::STDmaker generates this file.
#
#


=head1 TITLE PAGE

 Detailed Software Test Description (STD)

 for

 Perl DataPort::DataFile Program Module

 Revision: -

 Version: 

 Date: 2003/06/21

 Prepared for: General Public 

 Prepared by:  http://www.SoftwareDiamonds.com support@SoftwareDiamonds.com

 Classification: None

=head1 SCOPE

This detail STD and the 
L<General Perl Program Module (PM) STD|Test::STD::PerlSTD>
establishes the tests to verify the
requirements of Perl Program Module (PM) L<DataPort::DataFile|DataPort::DataFile>

The format of this STD is a tailored L<2167A STD DID|Docs::US_DOD::STD>.
in accordance with 
L<Detail STD Format|Test::STDmaker/Detail STD Format>.

#######
#  
#  4. TEST DESCRIPTIONS
#
#  4.1 Test 001
#
#  ..
#
#  4.x Test x
#
#

=head1 TEST DESCRIPTIONS

The test descriptions uses a legend to
identify different aspects of a test description
in accordance with
L<STD FormDB Test Description Fields|Test::STDmaker/STD FormDB Test Description Fields>.

=head2 Test Plan

 T: 10^

=head2 ok: 1


  C:
     use File::FileUtil;
     my $fu = 'File::FileUtil';
 ^
 VO: ^
  N: UUT not loaded^
  A: my $loaded = $fu->is_package_loaded('DataPort::DataFileI')^
  E:  ''^
 ok: 1^

=head2 ok: 2

  N: Load UUT^
  R: L<DataPort::DataFile/general [1] - load>^
  S: $loaded^
  C: my $errors = $fu->load_package( 'DataPort::DataFileI' )^
  A: $errors^
 SE: ''^
 ok: 2^

=head2 ok: 3

 VO: ^
  N: No pod errors^
  R: L<DataPort::DataFile/general [2] - pod check>^
  A: $fu->pod_errors( 'DataPort::DataFile')^
  E: 0^
 ok: 3^

=head2 ok: 4

 DO: ^
  A: $fu->fin( 'DataFile0.tdb' )^

  C:
     unlink 'DataFile1.txt';
     my $record;
     my ($array_p, $record_p) = ([], $record);
     my $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
                option1 => '1', option2 => '2' );
     while( $dbh->get($array_p, $record_p) ) {
         $fu->fout( 'DataFile1.txt', $$record_p . "\n~-~\n", {append=>1});
         $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~-~\n", {append=>1});
     }
 ^
  N: get with record^
  A: $fu->fin('DataFile1.txt')^
  E: $fu->fin('DataFile2.txt')^
 ok: 4^

=head2 ok: 5


  C:
     unlink 'DataFile1.txt';
     $dbh->finish();
     $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
                option3 => '3', option4 => '4',  option5 => '5' );
     while( $dbh->get($array_p) ) {
         $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~-~\n", {append=>1});
     }
     $dbh->finish();
 ^
  N: get without record^
  A: $fu->fin('DataFile1.txt')^
  E: $fu->fin('DataFile3.txt')^
 ok: 5^

=head2 ok: 6


  C:
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
 ^
  N: put with record^
  A: $fu->fin('DataFile1.tdb')^
  E: $fu->fin('DataFile2.tdb')^
 ok: 6^

=head2 ok: 7

  A: $fu->fin('DataFile1.txt')^
  E: $fu->fin('DataFile4.txt')^
 ok: 7^

=head2 ok: 8


  C:
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
 ^
  N: put with without record^
  A: $fu->fin('DataFile1.tdb')^
  E: $fu->fin('DataFile3.tdb')^
 ok: 8^

=head2 ok: 9


  C:
     unlink 'DataFile1.txt';
     unlink 'DataFile1.tdb';
     $dbh = new DataPort::DataFileI(flag => '>', file => 'DataFile1.tdb',
               binary => 1, option9 => '9' );
     @db = ( [ 'name5','data5','name6','data6'], [ 'name7', 'data7' ] );  
  
     foreach $array_p (@db) { 
         $dbh->put($array_p);
     }
     $dbh->finish();
 ^
  N: binary put with without record^
  A: $fu->fin('DataFile1.tdb')^
  E: $fu->fin('DataFile4.tdb')^
 ok: 9^

=head2 ok: 10


  C:
     unlink 'DataFile1.txt';
     unlink 'DataFile1.tdb';
     $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
                binary => 1, option10 => '10', option11 => '11' );
     while( $dbh->get($array_p, $record_p) ) {
         $fu->fout( 'DataFile1.txt', $$record_p . "\n~-~\n", {append=>1});
         $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~-~\n", {append=>1});
     }
     $dbh->finish();
 ^
  N: binary get with record^
  A: $fu->fin('DataFile1.txt')^
  E: $fu->fin('DataFile5.txt')^
 ok: 10^



#######
#  
#  5. REQUIREMENTS TRACEABILITY
#
#

=head1 REQUIREMENTS TRACEABILITY

  Requirement                                                      Test
 ---------------------------------------------------------------- ----------------------------------------------------------------
 L<DataPort::DataFile/general [1] - load>                         L<t::DataPort::DataFile/ok: 2>
 L<DataPort::DataFile/general [2] - pod check>                    L<t::DataPort::DataFile/ok: 3>


  Test                                                             Requirement
 ---------------------------------------------------------------- ----------------------------------------------------------------
 L<t::DataPort::DataFile/ok: 2>                                   L<DataPort::DataFile/general [1] - load>
 L<t::DataPort::DataFile/ok: 3>                                   L<DataPort::DataFile/general [2] - pod check>


=cut

#######
#  
#  6. NOTES
#
#

=head1 NOTES

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

#######
#
#  2. REFERENCED DOCUMENTS
#
#
#

=head1 SEE ALSO

L<DataPort::DataFile>

=back

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

__DATA__

File_Spec: Unix^
UUT: DataPort::DataFile^
Revision: -^
End_User: General Public^
Author: http://www.SoftwareDiamonds.com support@SoftwareDiamonds.com^
Detail_Template: ^
STD2167_Template: ^
Version: ^
Classification: None^
Temp: temp.pl^
Demo: DataFile.d^
Verify: DataFile.t^


 T: 10^


 C:
    use File::FileUtil;
    my $fu = 'File::FileUtil';
^

VO: ^
 N: UUT not loaded^
 A: my $loaded = $fu->is_package_loaded('DataPort::DataFileI')^
 E:  ''^
ok: 1^

 N: Load UUT^
 R: L<DataPort::DataFile/general [1] - load>^
 S: $loaded^
 C: my $errors = $fu->load_package( 'DataPort::DataFileI' )^
 A: $errors^
SE: ''^
ok: 2^

VO: ^
 N: No pod errors^
 R: L<DataPort::DataFile/general [2] - pod check>^
 A: $fu->pod_errors( 'DataPort::DataFile')^
 E: 0^
ok: 3^

DO: ^
 A: $fu->fin( 'DataFile0.tdb' )^

 C:
    unlink 'DataFile1.txt';

    my $record;
    my ($array_p, $record_p) = ([], \$record);
    my $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
               option1 => '1', option2 => '2' );

    while( $dbh->get($array_p, $record_p) ) {
        $fu->fout( 'DataFile1.txt', $$record_p . "\n~--~\n", {append=>1});
        $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~--~\n", {append=>1});
    }
^

 N: get with record^
 A: $fu->fin('DataFile1.txt')^
 E: $fu->fin('DataFile2.txt')^
ok: 4^


 C:
    unlink 'DataFile1.txt';
    $dbh->finish();

    $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
               option3 => '3', option4 => '4',  option5 => '5' );

    while( $dbh->get($array_p) ) {
        $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~--~\n", {append=>1});
    }
    $dbh->finish();
^

 N: get without record^
 A: $fu->fin('DataFile1.txt')^
 E: $fu->fin('DataFile3.txt')^
ok: 5^


 C:
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '>', file => 'DataFile1.tdb',
               option6 => '6', option7 => '7' );

    my @db = ( [ 'name1','data1','name2','data2'], [ 'name3', 'data3', 'name4', 'data4' ] );  
 
    foreach $array_p (@db) {
        $record = ''; 
        $dbh->put($array_p, $record_p);
        $fu->fout('DataFile1.txt', $$record_p . "\n~--~\n", {append=>1});
    }
    $dbh->finish();
^

 N: put with record^
 A: $fu->fin('DataFile1.tdb')^
 E: $fu->fin('DataFile2.tdb')^
ok: 6^

 A: $fu->fin('DataFile1.txt')^
 E: $fu->fin('DataFile4.txt')^
ok: 7^


 C:
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
^

 N: put with without record^
 A: $fu->fin('DataFile1.tdb')^
 E: $fu->fin('DataFile3.tdb')^
ok: 8^


 C:
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '>', file => 'DataFile1.tdb',
              binary => 1, option9 => '9' );

    @db = ( [ 'name5','data5','name6','data6'], [ 'name7', 'data7' ] );  
 
    foreach $array_p (@db) { 
        $dbh->put($array_p);
    }
    $dbh->finish();
^

 N: binary put with without record^
 A: $fu->fin('DataFile1.tdb')^
 E: $fu->fin('DataFile4.tdb')^
ok: 9^


 C:
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
               binary => 1, option10 => '10', option11 => '11' );

    while( $dbh->get($array_p, $record_p) ) {
        $fu->fout( 'DataFile1.txt', $$record_p . "\n~--~\n", {append=>1});
        $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~--~\n", {append=>1});
    }
    $dbh->finish();
^

 N: binary get with record^
 A: $fu->fin('DataFile1.txt')^
 E: $fu->fin('DataFile5.txt')^
ok: 10^


 C:
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';
^


See_Also: L<DataPort::DataFile>^

Copyright:
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
^


HTML:
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
^



~-~
