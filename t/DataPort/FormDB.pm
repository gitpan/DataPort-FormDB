#!perl
#
# The copyright notice and plain old documentation (POD)
# are at the end of this file.
#
package  t::DataPort::FormDB;

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

 Perl DataPort/FileType/FormDB.pm Program Module

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
requirements of Perl Program Module (PM) L<DataPort/FileType/FormDB.pm|DataPort/FileType/FormDB.pm>

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

 T: 12^

=head2 ok: 1


  C:
     use File::FileUtil;
     my $fu = 'File::FileUtil';
 ^
 VO: ^
  N: UUT not loaded^
  A: my $loaded = $fu->is_package_loaded('DataPort::FileType::FormDB')^
  E:  ''^
 ok: 1^

=head2 ok: 2

  N: Load UUT^
  R: L<DataPort::FileType::FormDB/general [1] - load>^
  S: $loaded^
  C: my $errors = $fu->load_package( 'DataPort::FileType::FormDB' )^
  A: $errors^
 SE: ''^
 ok: 2^

=head2 ok: 3

 VO: ^
  N: No pod errors^
  R: L<DataPort::FileType::FormDB/general [2] - pod check>^
  A: $fu->pod_errors( 'DataPort::FileType::FormDB')^
  E: 0^
 ok: 3^

=head2 ok: 4

 DO: ^
  A: $fu->fin( 'FormDB0.tdb' )^

  C:
     #######
     # Test the lenient format.
     #
     unlink 'FormDBa1.tdb';
     unlink 'FormDBr1.txt';
     unlink 'FormDBa1.txt';
     my $dbh_in = new DataPort::FileType::FormDB(flag=>'<', file=>'FormDB0.tdb');
     my $dbh_out = new DataPort::FileType::FormDB(flag=>'>', file=>'FormDBa1.tdb');
     my ($$record_p, $$fields_p) = ('','');
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
 ^

  R:
      L<DataPort::FileType::FormDB/format [1] - separator strings>
      L<DataPort::FileType::FormDB/format [2] - separator escapes>
      L<DataPort::FileType::FormDB/format [3] - field names>
      L<DataPort::FileType::FormDB/format [4] - field names>
      L<DataPort::FileType::FormDB/format [5] - EON>
      L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
      L<DataPort::FileType::FormDB/methods [4] - decode_record>
      L<DataPort::FileType::FormDB/methods [6] - get_record>
      L<DataPort::FileType::FormDB/methods [7] - get_record>
 ^
  N: Lenient Record^
  A: $fu->fin('FormDBr1.txt')^
  E: $fu->fin('FormDBr2.txt')^
 ok: 4^

=head2 ok: 5


  R:
      L<DataPort::FileType::FormDB/format [1] - separator strings>
      L<DataPort::FileType::FormDB/format [2] - separator escapes>
      L<DataPort::FileType::FormDB/format [3] - field names>
      L<DataPort::FileType::FormDB/format [4] - field names>
      L<DataPort::FileType::FormDB/format [5] - EON>
      L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
      L<DataPort::FileType::FormDB/methods [2] - decode_field>
 ^
  N: Lenient Get Array^
  A: $fu->fin('FormDBa1.txt')^
  E: $fu->fin('FormDBa2.txt')^
 ok: 5^

=head2 ok: 6


  R:
      L<DataPort::FileType::FormDB/format [1] - separator strings>
      L<DataPort::FileType::FormDB/format [2] - separator escapes>
      L<DataPort::FileType::FormDB/format [3] - field names>
      L<DataPort::FileType::FormDB/format [4] - field names>
      L<DataPort::FileType::FormDB/format [5] - EON>
      L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
      L<DataPort::FileType::FormDB/methods [1] - encode_field>
      L<DataPort::FileType::FormDB/methods [3] - encode_record>
      L<DataPort::FileType::FormDB/methods [5] - put_record>
 ^
  N: Lenient Put Array^
  A: $fu->fin('FormDBa1.tdb')^
  E: $fu->fin('FormDBa2.tdb')^
 ok: 6^

=head2 ok: 7

 DO: ^
  A: $fu->fin( 'FormDBs0.tdb' )^

  C:
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
 ^

  R:
      L<DataPort::FileType::FormDB/format [1] - separator strings>
      L<DataPort::FileType::FormDB/format [2] - separator escapes>
      L<DataPort::FileType::FormDB/format [3] - field names>
      L<DataPort::FileType::FormDB/format [4] - field names>
      L<DataPort::FileType::FormDB/format [5] - EON>
      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
      L<DataPort::FileType::FormDB/methods [4] - decode_record>
      L<DataPort::FileType::FormDB/methods [6] - get_record>
      L<DataPort::FileType::FormDB/methods [7] - get_record>
 ^
  N: Strict Record^
  A: $fu->fin('FormDBr1.txt')^
  E: $fu->fin('FormDBr3.txt')^
 ok: 7^

=head2 ok: 8


  R:
      L<DataPort::FileType::FormDB/format [1] - separator strings>
      L<DataPort::FileType::FormDB/format [2] - separator escapes>
      L<DataPort::FileType::FormDB/format [3] - field names>
      L<DataPort::FileType::FormDB/format [4] - field names>
      L<DataPort::FileType::FormDB/format [5] - EON>
      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
      L<DataPort::FileType::FormDB/methods [2] - decode_field>
 ^
  N: Strict Get Array^
  A: $fu->fin('FormDBa1.txt')^
  E: $fu->fin('FormDBa3.txt')^
 ok: 8^

=head2 ok: 9


  R:
      L<DataPort::FileType::FormDB/format [1] - separator strings>
      L<DataPort::FileType::FormDB/format [2] - separator escapes>
      L<DataPort::FileType::FormDB/format [3] - field names>
      L<DataPort::FileType::FormDB/format [4] - field names>
      L<DataPort::FileType::FormDB/format [5] - EON>
      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
      L<DataPort::FileType::FormDB/methods [1] - encode_field>
      L<DataPort::FileType::FormDB/methods [3] - encode_record>
      L<DataPort::FileType::FormDB/methods [5] - put_record>
 ^
  N: Strict Put Array^
  A: $fu->fin('FormDBa1.tdb')^
  E: $fu->fin('FormDBa3.tdb')^
 ok: 9^

=head2 ok: 10


  C:
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
 ^

  R:
      L<DataPort::FileType::FormDB/format [1] - separator strings>
      L<DataPort::FileType::FormDB/format [2] - separator escapes>
      L<DataPort::FileType::FormDB/format [3] - field names>
      L<DataPort::FileType::FormDB/format [4] - field names>
      L<DataPort::FileType::FormDB/format [5] - EON>
      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
      L<DataPort::FileType::FormDB/methods [4] - decode_record>
      L<DataPort::FileType::FormDB/methods [6] - get_record>
      L<DataPort::FileType::FormDB/methods [7] - get_record>
 ^
  N: Strict Binary Record^
  A: $fu->fin('FormDBr1.txt', {binary=>1})^
  E: $fu->fin('FormDBr4.txt', {binary=>1})^
 ok: 10^

=head2 ok: 11


  R:
      L<DataPort::FileType::FormDB/format [1] - separator strings>
      L<DataPort::FileType::FormDB/format [2] - separator escapes>
      L<DataPort::FileType::FormDB/format [3] - field names>
      L<DataPort::FileType::FormDB/format [4] - field names>
      L<DataPort::FileType::FormDB/format [5] - EON>
      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
      L<DataPort::FileType::FormDB/methods [2] - decode_field>
 ^
  N: Strict Binary Get Array^
  A: $fu->fin('FormDBa1.txt', {binary=>1})^
  E: $fu->fin('FormDBa4.txt', {binary=>1})^
 ok: 11^

=head2 ok: 12


  R:
      L<DataPort::FileType::FormDB/format [1] - separator strings>
      L<DataPort::FileType::FormDB/format [2] - separator escapes>
      L<DataPort::FileType::FormDB/format [3] - field names>
      L<DataPort::FileType::FormDB/format [4] - field names>
      L<DataPort::FileType::FormDB/format [5] - EON>
      L<DataPort::FileType::FormDB/format [6] - Strict EOD>
      L<DataPort::FileType::FormDB/methods [1] - encode_field>
      L<DataPort::FileType::FormDB/methods [3] - encode_record>
      L<DataPort::FileType::FormDB/methods [5] - put_record>
 ^
  N: Strict Binary Put Array^
  A: $fu->fin('FormDBa1.tdb', {binary=>1})^
  E: $fu->fin('FormDBa4.tdb', {binary=>1})^
 ok: 12^



#######
#  
#  5. REQUIREMENTS TRACEABILITY
#
#

=head1 REQUIREMENTS TRACEABILITY

  Requirement                                                      Test
 ---------------------------------------------------------------- ----------------------------------------------------------------
 L<DataPort::FileType::FormDB/format [1] - separator strings>     L<t::DataPort::FormDB/ok: 10>
 L<DataPort::FileType::FormDB/format [1] - separator strings>     L<t::DataPort::FormDB/ok: 11>
 L<DataPort::FileType::FormDB/format [1] - separator strings>     L<t::DataPort::FormDB/ok: 12>
 L<DataPort::FileType::FormDB/format [1] - separator strings>     L<t::DataPort::FormDB/ok: 4>
 L<DataPort::FileType::FormDB/format [1] - separator strings>     L<t::DataPort::FormDB/ok: 5>
 L<DataPort::FileType::FormDB/format [1] - separator strings>     L<t::DataPort::FormDB/ok: 6>
 L<DataPort::FileType::FormDB/format [1] - separator strings>     L<t::DataPort::FormDB/ok: 7>
 L<DataPort::FileType::FormDB/format [1] - separator strings>     L<t::DataPort::FormDB/ok: 8>
 L<DataPort::FileType::FormDB/format [1] - separator strings>     L<t::DataPort::FormDB/ok: 9>
 L<DataPort::FileType::FormDB/format [2] - separator escapes>     L<t::DataPort::FormDB/ok: 10>
 L<DataPort::FileType::FormDB/format [2] - separator escapes>     L<t::DataPort::FormDB/ok: 11>
 L<DataPort::FileType::FormDB/format [2] - separator escapes>     L<t::DataPort::FormDB/ok: 12>
 L<DataPort::FileType::FormDB/format [2] - separator escapes>     L<t::DataPort::FormDB/ok: 4>
 L<DataPort::FileType::FormDB/format [2] - separator escapes>     L<t::DataPort::FormDB/ok: 5>
 L<DataPort::FileType::FormDB/format [2] - separator escapes>     L<t::DataPort::FormDB/ok: 6>
 L<DataPort::FileType::FormDB/format [2] - separator escapes>     L<t::DataPort::FormDB/ok: 7>
 L<DataPort::FileType::FormDB/format [2] - separator escapes>     L<t::DataPort::FormDB/ok: 8>
 L<DataPort::FileType::FormDB/format [2] - separator escapes>     L<t::DataPort::FormDB/ok: 9>
 L<DataPort::FileType::FormDB/format [3] - field names>           L<t::DataPort::FormDB/ok: 10>
 L<DataPort::FileType::FormDB/format [3] - field names>           L<t::DataPort::FormDB/ok: 11>
 L<DataPort::FileType::FormDB/format [3] - field names>           L<t::DataPort::FormDB/ok: 12>
 L<DataPort::FileType::FormDB/format [3] - field names>           L<t::DataPort::FormDB/ok: 4>
 L<DataPort::FileType::FormDB/format [3] - field names>           L<t::DataPort::FormDB/ok: 5>
 L<DataPort::FileType::FormDB/format [3] - field names>           L<t::DataPort::FormDB/ok: 6>
 L<DataPort::FileType::FormDB/format [3] - field names>           L<t::DataPort::FormDB/ok: 7>
 L<DataPort::FileType::FormDB/format [3] - field names>           L<t::DataPort::FormDB/ok: 8>
 L<DataPort::FileType::FormDB/format [3] - field names>           L<t::DataPort::FormDB/ok: 9>
 L<DataPort::FileType::FormDB/format [4] - field names>           L<t::DataPort::FormDB/ok: 10>
 L<DataPort::FileType::FormDB/format [4] - field names>           L<t::DataPort::FormDB/ok: 11>
 L<DataPort::FileType::FormDB/format [4] - field names>           L<t::DataPort::FormDB/ok: 12>
 L<DataPort::FileType::FormDB/format [4] - field names>           L<t::DataPort::FormDB/ok: 4>
 L<DataPort::FileType::FormDB/format [4] - field names>           L<t::DataPort::FormDB/ok: 5>
 L<DataPort::FileType::FormDB/format [4] - field names>           L<t::DataPort::FormDB/ok: 6>
 L<DataPort::FileType::FormDB/format [4] - field names>           L<t::DataPort::FormDB/ok: 7>
 L<DataPort::FileType::FormDB/format [4] - field names>           L<t::DataPort::FormDB/ok: 8>
 L<DataPort::FileType::FormDB/format [4] - field names>           L<t::DataPort::FormDB/ok: 9>
 L<DataPort::FileType::FormDB/format [5] - EON>                   L<t::DataPort::FormDB/ok: 10>
 L<DataPort::FileType::FormDB/format [5] - EON>                   L<t::DataPort::FormDB/ok: 11>
 L<DataPort::FileType::FormDB/format [5] - EON>                   L<t::DataPort::FormDB/ok: 12>
 L<DataPort::FileType::FormDB/format [5] - EON>                   L<t::DataPort::FormDB/ok: 4>
 L<DataPort::FileType::FormDB/format [5] - EON>                   L<t::DataPort::FormDB/ok: 5>
 L<DataPort::FileType::FormDB/format [5] - EON>                   L<t::DataPort::FormDB/ok: 6>
 L<DataPort::FileType::FormDB/format [5] - EON>                   L<t::DataPort::FormDB/ok: 7>
 L<DataPort::FileType::FormDB/format [5] - EON>                   L<t::DataPort::FormDB/ok: 8>
 L<DataPort::FileType::FormDB/format [5] - EON>                   L<t::DataPort::FormDB/ok: 9>
 L<DataPort::FileType::FormDB/format [6] - Strict EOD>            L<t::DataPort::FormDB/ok: 10>
 L<DataPort::FileType::FormDB/format [6] - Strict EOD>            L<t::DataPort::FormDB/ok: 11>
 L<DataPort::FileType::FormDB/format [6] - Strict EOD>            L<t::DataPort::FormDB/ok: 12>
 L<DataPort::FileType::FormDB/format [6] - Strict EOD>            L<t::DataPort::FormDB/ok: 7>
 L<DataPort::FileType::FormDB/format [6] - Strict EOD>            L<t::DataPort::FormDB/ok: 8>
 L<DataPort::FileType::FormDB/format [6] - Strict EOD>            L<t::DataPort::FormDB/ok: 9>
 L<DataPort::FileType::FormDB/format [7] - Lenient EOD>           L<t::DataPort::FormDB/ok: 4>
 L<DataPort::FileType::FormDB/format [7] - Lenient EOD>           L<t::DataPort::FormDB/ok: 5>
 L<DataPort::FileType::FormDB/format [7] - Lenient EOD>           L<t::DataPort::FormDB/ok: 6>
 L<DataPort::FileType::FormDB/general [1] - load>                 L<t::DataPort::FormDB/ok: 2>
 L<DataPort::FileType::FormDB/general [2] - pod check>            L<t::DataPort::FormDB/ok: 3>
 L<DataPort::FileType::FormDB/methods [1] - encode_field>         L<t::DataPort::FormDB/ok: 12>
 L<DataPort::FileType::FormDB/methods [1] - encode_field>         L<t::DataPort::FormDB/ok: 6>
 L<DataPort::FileType::FormDB/methods [1] - encode_field>         L<t::DataPort::FormDB/ok: 9>
 L<DataPort::FileType::FormDB/methods [2] - decode_field>         L<t::DataPort::FormDB/ok: 11>
 L<DataPort::FileType::FormDB/methods [2] - decode_field>         L<t::DataPort::FormDB/ok: 5>
 L<DataPort::FileType::FormDB/methods [2] - decode_field>         L<t::DataPort::FormDB/ok: 8>
 L<DataPort::FileType::FormDB/methods [3] - encode_record>        L<t::DataPort::FormDB/ok: 12>
 L<DataPort::FileType::FormDB/methods [3] - encode_record>        L<t::DataPort::FormDB/ok: 6>
 L<DataPort::FileType::FormDB/methods [3] - encode_record>        L<t::DataPort::FormDB/ok: 9>
 L<DataPort::FileType::FormDB/methods [4] - decode_record>        L<t::DataPort::FormDB/ok: 10>
 L<DataPort::FileType::FormDB/methods [4] - decode_record>        L<t::DataPort::FormDB/ok: 4>
 L<DataPort::FileType::FormDB/methods [4] - decode_record>        L<t::DataPort::FormDB/ok: 7>
 L<DataPort::FileType::FormDB/methods [5] - put_record>           L<t::DataPort::FormDB/ok: 12>
 L<DataPort::FileType::FormDB/methods [5] - put_record>           L<t::DataPort::FormDB/ok: 6>
 L<DataPort::FileType::FormDB/methods [5] - put_record>           L<t::DataPort::FormDB/ok: 9>
 L<DataPort::FileType::FormDB/methods [6] - get_record>           L<t::DataPort::FormDB/ok: 10>
 L<DataPort::FileType::FormDB/methods [6] - get_record>           L<t::DataPort::FormDB/ok: 4>
 L<DataPort::FileType::FormDB/methods [6] - get_record>           L<t::DataPort::FormDB/ok: 7>
 L<DataPort::FileType::FormDB/methods [7] - get_record>           L<t::DataPort::FormDB/ok: 10>
 L<DataPort::FileType::FormDB/methods [7] - get_record>           L<t::DataPort::FormDB/ok: 4>
 L<DataPort::FileType::FormDB/methods [7] - get_record>           L<t::DataPort::FormDB/ok: 7>


  Test                                                             Requirement
 ---------------------------------------------------------------- ----------------------------------------------------------------
 L<t::DataPort::FormDB/ok: 10>                                    L<DataPort::FileType::FormDB/format [1] - separator strings>
 L<t::DataPort::FormDB/ok: 10>                                    L<DataPort::FileType::FormDB/format [2] - separator escapes>
 L<t::DataPort::FormDB/ok: 10>                                    L<DataPort::FileType::FormDB/format [3] - field names>
 L<t::DataPort::FormDB/ok: 10>                                    L<DataPort::FileType::FormDB/format [4] - field names>
 L<t::DataPort::FormDB/ok: 10>                                    L<DataPort::FileType::FormDB/format [5] - EON>
 L<t::DataPort::FormDB/ok: 10>                                    L<DataPort::FileType::FormDB/format [6] - Strict EOD>
 L<t::DataPort::FormDB/ok: 10>                                    L<DataPort::FileType::FormDB/methods [4] - decode_record>
 L<t::DataPort::FormDB/ok: 10>                                    L<DataPort::FileType::FormDB/methods [6] - get_record>
 L<t::DataPort::FormDB/ok: 10>                                    L<DataPort::FileType::FormDB/methods [7] - get_record>
 L<t::DataPort::FormDB/ok: 11>                                    L<DataPort::FileType::FormDB/format [1] - separator strings>
 L<t::DataPort::FormDB/ok: 11>                                    L<DataPort::FileType::FormDB/format [2] - separator escapes>
 L<t::DataPort::FormDB/ok: 11>                                    L<DataPort::FileType::FormDB/format [3] - field names>
 L<t::DataPort::FormDB/ok: 11>                                    L<DataPort::FileType::FormDB/format [4] - field names>
 L<t::DataPort::FormDB/ok: 11>                                    L<DataPort::FileType::FormDB/format [5] - EON>
 L<t::DataPort::FormDB/ok: 11>                                    L<DataPort::FileType::FormDB/format [6] - Strict EOD>
 L<t::DataPort::FormDB/ok: 11>                                    L<DataPort::FileType::FormDB/methods [2] - decode_field>
 L<t::DataPort::FormDB/ok: 12>                                    L<DataPort::FileType::FormDB/format [1] - separator strings>
 L<t::DataPort::FormDB/ok: 12>                                    L<DataPort::FileType::FormDB/format [2] - separator escapes>
 L<t::DataPort::FormDB/ok: 12>                                    L<DataPort::FileType::FormDB/format [3] - field names>
 L<t::DataPort::FormDB/ok: 12>                                    L<DataPort::FileType::FormDB/format [4] - field names>
 L<t::DataPort::FormDB/ok: 12>                                    L<DataPort::FileType::FormDB/format [5] - EON>
 L<t::DataPort::FormDB/ok: 12>                                    L<DataPort::FileType::FormDB/format [6] - Strict EOD>
 L<t::DataPort::FormDB/ok: 12>                                    L<DataPort::FileType::FormDB/methods [1] - encode_field>
 L<t::DataPort::FormDB/ok: 12>                                    L<DataPort::FileType::FormDB/methods [3] - encode_record>
 L<t::DataPort::FormDB/ok: 12>                                    L<DataPort::FileType::FormDB/methods [5] - put_record>
 L<t::DataPort::FormDB/ok: 2>                                     L<DataPort::FileType::FormDB/general [1] - load>
 L<t::DataPort::FormDB/ok: 3>                                     L<DataPort::FileType::FormDB/general [2] - pod check>
 L<t::DataPort::FormDB/ok: 4>                                     L<DataPort::FileType::FormDB/format [1] - separator strings>
 L<t::DataPort::FormDB/ok: 4>                                     L<DataPort::FileType::FormDB/format [2] - separator escapes>
 L<t::DataPort::FormDB/ok: 4>                                     L<DataPort::FileType::FormDB/format [3] - field names>
 L<t::DataPort::FormDB/ok: 4>                                     L<DataPort::FileType::FormDB/format [4] - field names>
 L<t::DataPort::FormDB/ok: 4>                                     L<DataPort::FileType::FormDB/format [5] - EON>
 L<t::DataPort::FormDB/ok: 4>                                     L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
 L<t::DataPort::FormDB/ok: 4>                                     L<DataPort::FileType::FormDB/methods [4] - decode_record>
 L<t::DataPort::FormDB/ok: 4>                                     L<DataPort::FileType::FormDB/methods [6] - get_record>
 L<t::DataPort::FormDB/ok: 4>                                     L<DataPort::FileType::FormDB/methods [7] - get_record>
 L<t::DataPort::FormDB/ok: 5>                                     L<DataPort::FileType::FormDB/format [1] - separator strings>
 L<t::DataPort::FormDB/ok: 5>                                     L<DataPort::FileType::FormDB/format [2] - separator escapes>
 L<t::DataPort::FormDB/ok: 5>                                     L<DataPort::FileType::FormDB/format [3] - field names>
 L<t::DataPort::FormDB/ok: 5>                                     L<DataPort::FileType::FormDB/format [4] - field names>
 L<t::DataPort::FormDB/ok: 5>                                     L<DataPort::FileType::FormDB/format [5] - EON>
 L<t::DataPort::FormDB/ok: 5>                                     L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
 L<t::DataPort::FormDB/ok: 5>                                     L<DataPort::FileType::FormDB/methods [2] - decode_field>
 L<t::DataPort::FormDB/ok: 6>                                     L<DataPort::FileType::FormDB/format [1] - separator strings>
 L<t::DataPort::FormDB/ok: 6>                                     L<DataPort::FileType::FormDB/format [2] - separator escapes>
 L<t::DataPort::FormDB/ok: 6>                                     L<DataPort::FileType::FormDB/format [3] - field names>
 L<t::DataPort::FormDB/ok: 6>                                     L<DataPort::FileType::FormDB/format [4] - field names>
 L<t::DataPort::FormDB/ok: 6>                                     L<DataPort::FileType::FormDB/format [5] - EON>
 L<t::DataPort::FormDB/ok: 6>                                     L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
 L<t::DataPort::FormDB/ok: 6>                                     L<DataPort::FileType::FormDB/methods [1] - encode_field>
 L<t::DataPort::FormDB/ok: 6>                                     L<DataPort::FileType::FormDB/methods [3] - encode_record>
 L<t::DataPort::FormDB/ok: 6>                                     L<DataPort::FileType::FormDB/methods [5] - put_record>
 L<t::DataPort::FormDB/ok: 7>                                     L<DataPort::FileType::FormDB/format [1] - separator strings>
 L<t::DataPort::FormDB/ok: 7>                                     L<DataPort::FileType::FormDB/format [2] - separator escapes>
 L<t::DataPort::FormDB/ok: 7>                                     L<DataPort::FileType::FormDB/format [3] - field names>
 L<t::DataPort::FormDB/ok: 7>                                     L<DataPort::FileType::FormDB/format [4] - field names>
 L<t::DataPort::FormDB/ok: 7>                                     L<DataPort::FileType::FormDB/format [5] - EON>
 L<t::DataPort::FormDB/ok: 7>                                     L<DataPort::FileType::FormDB/format [6] - Strict EOD>
 L<t::DataPort::FormDB/ok: 7>                                     L<DataPort::FileType::FormDB/methods [4] - decode_record>
 L<t::DataPort::FormDB/ok: 7>                                     L<DataPort::FileType::FormDB/methods [6] - get_record>
 L<t::DataPort::FormDB/ok: 7>                                     L<DataPort::FileType::FormDB/methods [7] - get_record>
 L<t::DataPort::FormDB/ok: 8>                                     L<DataPort::FileType::FormDB/format [1] - separator strings>
 L<t::DataPort::FormDB/ok: 8>                                     L<DataPort::FileType::FormDB/format [2] - separator escapes>
 L<t::DataPort::FormDB/ok: 8>                                     L<DataPort::FileType::FormDB/format [3] - field names>
 L<t::DataPort::FormDB/ok: 8>                                     L<DataPort::FileType::FormDB/format [4] - field names>
 L<t::DataPort::FormDB/ok: 8>                                     L<DataPort::FileType::FormDB/format [5] - EON>
 L<t::DataPort::FormDB/ok: 8>                                     L<DataPort::FileType::FormDB/format [6] - Strict EOD>
 L<t::DataPort::FormDB/ok: 8>                                     L<DataPort::FileType::FormDB/methods [2] - decode_field>
 L<t::DataPort::FormDB/ok: 9>                                     L<DataPort::FileType::FormDB/format [1] - separator strings>
 L<t::DataPort::FormDB/ok: 9>                                     L<DataPort::FileType::FormDB/format [2] - separator escapes>
 L<t::DataPort::FormDB/ok: 9>                                     L<DataPort::FileType::FormDB/format [3] - field names>
 L<t::DataPort::FormDB/ok: 9>                                     L<DataPort::FileType::FormDB/format [4] - field names>
 L<t::DataPort::FormDB/ok: 9>                                     L<DataPort::FileType::FormDB/format [5] - EON>
 L<t::DataPort::FormDB/ok: 9>                                     L<DataPort::FileType::FormDB/format [6] - Strict EOD>
 L<t::DataPort::FormDB/ok: 9>                                     L<DataPort::FileType::FormDB/methods [1] - encode_field>
 L<t::DataPort::FormDB/ok: 9>                                     L<DataPort::FileType::FormDB/methods [3] - encode_record>
 L<t::DataPort::FormDB/ok: 9>                                     L<DataPort::FileType::FormDB/methods [5] - put_record>


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

#######
#
#  2. REFERENCED DOCUMENTS
#
#
#

=head1 SEE ALSO

L<DataPort::FileType::FormDB>

=back

=for html


=cut

__DATA__

File_Spec: Unix^
UUT: DataPort/FileType/FormDB.pm^
Revision: -^
End_User: General Public^
Author: http://www.SoftwareDiamonds.com support@SoftwareDiamonds.com^
Detail_Template: ^
STD2167_Template: ^
Version: ^
Classification: None^
Temp: temp.pl^
Demo: FormDB.d^
Verify: FormDB.t^


 T: 12^


 C:
    use File::FileUtil;
    my $fu = 'File::FileUtil';
^

VO: ^
 N: UUT not loaded^
 A: my $loaded = $fu->is_package_loaded('DataPort::FileType::FormDB')^
 E:  ''^
ok: 1^

 N: Load UUT^
 R: L<DataPort::FileType::FormDB/general [1] - load>^
 S: $loaded^
 C: my $errors = $fu->load_package( 'DataPort::FileType::FormDB' )^
 A: $errors^
SE: ''^
ok: 2^

VO: ^
 N: No pod errors^
 R: L<DataPort::FileType::FormDB/general [2] - pod check>^
 A: $fu->pod_errors( 'DataPort::FileType::FormDB')^
 E: 0^
ok: 3^

DO: ^
 A: $fu->fin( 'FormDB0.tdb' )^

 C:
    #######
    # Test the lenient format.
    #
    unlink 'FormDBa1.tdb';
    unlink 'FormDBr1.txt';
    unlink 'FormDBa1.txt';

    my $dbh_in = new DataPort::FileType::FormDB(flag=>'<', file=>'FormDB0.tdb');
    my $dbh_out = new DataPort::FileType::FormDB(flag=>'>', file=>'FormDBa1.tdb');

    my ($$record_p, $$fields_p) = ('','');
    my $array_p = [];
    while( $dbh_in->get_record($record_p) ) {
        $dbh_in->decode_record($record_p,$fields_p);
        $fu->fout( 'FormDBr1.txt',$$fields_p . "\n~--~\n", {append=>1} );
        $dbh_in->decode_field($fields_p, $array_p);
        $fu->fout( 'FormDBa1.txt',join("\n",@$array_p) . "\n~--~\n", {append=>1});
        ($$record_p, $$fields_p) = ('','');
        $dbh_out->encode_field( $array_p, $fields_p );
        $dbh_out->encode_record( $fields_p, $record_p);
        $dbh_out->put_record($record_p);
        ($$record_p, $$fields_p) = ('','');
    }

    $dbh_out->finish();
    $dbh_in->finish();
^


 R:
     L<DataPort::FileType::FormDB/format [1] - separator strings>
     L<DataPort::FileType::FormDB/format [2] - separator escapes>
     L<DataPort::FileType::FormDB/format [3] - field names>
     L<DataPort::FileType::FormDB/format [4] - field names>
     L<DataPort::FileType::FormDB/format [5] - EON>
     L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
     L<DataPort::FileType::FormDB/methods [4] - decode_record>
     L<DataPort::FileType::FormDB/methods [6] - get_record>
     L<DataPort::FileType::FormDB/methods [7] - get_record>
^

 N: Lenient Record^
 A: $fu->fin('FormDBr1.txt')^
 E: $fu->fin('FormDBr2.txt')^
ok: 4^


 R:
     L<DataPort::FileType::FormDB/format [1] - separator strings>
     L<DataPort::FileType::FormDB/format [2] - separator escapes>
     L<DataPort::FileType::FormDB/format [3] - field names>
     L<DataPort::FileType::FormDB/format [4] - field names>
     L<DataPort::FileType::FormDB/format [5] - EON>
     L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
     L<DataPort::FileType::FormDB/methods [2] - decode_field>
^

 N: Lenient Get Array^
 A: $fu->fin('FormDBa1.txt')^
 E: $fu->fin('FormDBa2.txt')^
ok: 5^


 R:
     L<DataPort::FileType::FormDB/format [1] - separator strings>
     L<DataPort::FileType::FormDB/format [2] - separator escapes>
     L<DataPort::FileType::FormDB/format [3] - field names>
     L<DataPort::FileType::FormDB/format [4] - field names>
     L<DataPort::FileType::FormDB/format [5] - EON>
     L<DataPort::FileType::FormDB/format [7] - Lenient EOD>
     L<DataPort::FileType::FormDB/methods [1] - encode_field>
     L<DataPort::FileType::FormDB/methods [3] - encode_record>
     L<DataPort::FileType::FormDB/methods [5] - put_record>
^

 N: Lenient Put Array^
 A: $fu->fin('FormDBa1.tdb')^
 E: $fu->fin('FormDBa2.tdb')^
ok: 6^

DO: ^
 A: $fu->fin( 'FormDBs0.tdb' )^

 C:
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
        $fu->fout( 'FormDBr1.txt',$$record_p . "\n~--~\n", {append=>1} );
        $dbh_in->decode_field($record_p, $array_p);
        $fu->fout( 'FormDBa1.txt',join("\n",@$array_p) . "\n~--~\n", {append=>1});
        ($$record_p, $$fields_p) = ('','');
        $dbh_out->encode_field( $array_p, $record_p );
        $dbh_out->encode_record($record_p);
        $dbh_out->put_record($record_p);
        ($$record_p, $$fields_p) = ('','');
    }


    $dbh_out->finish();
    $dbh_in->finish();
^


 R:
     L<DataPort::FileType::FormDB/format [1] - separator strings>
     L<DataPort::FileType::FormDB/format [2] - separator escapes>
     L<DataPort::FileType::FormDB/format [3] - field names>
     L<DataPort::FileType::FormDB/format [4] - field names>
     L<DataPort::FileType::FormDB/format [5] - EON>
     L<DataPort::FileType::FormDB/format [6] - Strict EOD>
     L<DataPort::FileType::FormDB/methods [4] - decode_record>
     L<DataPort::FileType::FormDB/methods [6] - get_record>
     L<DataPort::FileType::FormDB/methods [7] - get_record>
^

 N: Strict Record^
 A: $fu->fin('FormDBr1.txt')^
 E: $fu->fin('FormDBr3.txt')^
ok: 7^


 R:
     L<DataPort::FileType::FormDB/format [1] - separator strings>
     L<DataPort::FileType::FormDB/format [2] - separator escapes>
     L<DataPort::FileType::FormDB/format [3] - field names>
     L<DataPort::FileType::FormDB/format [4] - field names>
     L<DataPort::FileType::FormDB/format [5] - EON>
     L<DataPort::FileType::FormDB/format [6] - Strict EOD>
     L<DataPort::FileType::FormDB/methods [2] - decode_field>
^

 N: Strict Get Array^
 A: $fu->fin('FormDBa1.txt')^
 E: $fu->fin('FormDBa3.txt')^
ok: 8^


 R:
     L<DataPort::FileType::FormDB/format [1] - separator strings>
     L<DataPort::FileType::FormDB/format [2] - separator escapes>
     L<DataPort::FileType::FormDB/format [3] - field names>
     L<DataPort::FileType::FormDB/format [4] - field names>
     L<DataPort::FileType::FormDB/format [5] - EON>
     L<DataPort::FileType::FormDB/format [6] - Strict EOD>
     L<DataPort::FileType::FormDB/methods [1] - encode_field>
     L<DataPort::FileType::FormDB/methods [3] - encode_record>
     L<DataPort::FileType::FormDB/methods [5] - put_record>
^

 N: Strict Put Array^
 A: $fu->fin('FormDBa1.tdb')^
 E: $fu->fin('FormDBa3.tdb')^
ok: 9^


 C:
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
        $fu->fout( 'FormDBr1.txt',$$record_p . "\n~--~\n", {append=>1} );
        $dbh_in->decode_field($record_p, $array_p);
        $fu->fout( 'FormDBa1.txt',join("\n",@$array_p) . "\n~--~\n", {append=>1});
        ($$record_p, $$fields_p) = ('','');
        $dbh_out->encode_field( $array_p, $record_p );
        $dbh_out->encode_record( $record_p, $record_p);
        $dbh_out->put_record($record_p);
        ($$record_p, $$fields_p) = ('','');
    }

    $dbh_out->finish();
    $dbh_in->finish();
^


 R:
     L<DataPort::FileType::FormDB/format [1] - separator strings>
     L<DataPort::FileType::FormDB/format [2] - separator escapes>
     L<DataPort::FileType::FormDB/format [3] - field names>
     L<DataPort::FileType::FormDB/format [4] - field names>
     L<DataPort::FileType::FormDB/format [5] - EON>
     L<DataPort::FileType::FormDB/format [6] - Strict EOD>
     L<DataPort::FileType::FormDB/methods [4] - decode_record>
     L<DataPort::FileType::FormDB/methods [6] - get_record>
     L<DataPort::FileType::FormDB/methods [7] - get_record>
^

 N: Strict Binary Record^
 A: $fu->fin('FormDBr1.txt', {binary=>1})^
 E: $fu->fin('FormDBr4.txt', {binary=>1})^
ok: 10^


 R:
     L<DataPort::FileType::FormDB/format [1] - separator strings>
     L<DataPort::FileType::FormDB/format [2] - separator escapes>
     L<DataPort::FileType::FormDB/format [3] - field names>
     L<DataPort::FileType::FormDB/format [4] - field names>
     L<DataPort::FileType::FormDB/format [5] - EON>
     L<DataPort::FileType::FormDB/format [6] - Strict EOD>
     L<DataPort::FileType::FormDB/methods [2] - decode_field>
^

 N: Strict Binary Get Array^
 A: $fu->fin('FormDBa1.txt', {binary=>1})^
 E: $fu->fin('FormDBa4.txt', {binary=>1})^
ok: 11^


 R:
     L<DataPort::FileType::FormDB/format [1] - separator strings>
     L<DataPort::FileType::FormDB/format [2] - separator escapes>
     L<DataPort::FileType::FormDB/format [3] - field names>
     L<DataPort::FileType::FormDB/format [4] - field names>
     L<DataPort::FileType::FormDB/format [5] - EON>
     L<DataPort::FileType::FormDB/format [6] - Strict EOD>
     L<DataPort::FileType::FormDB/methods [1] - encode_field>
     L<DataPort::FileType::FormDB/methods [3] - encode_record>
     L<DataPort::FileType::FormDB/methods [5] - put_record>
^

 N: Strict Binary Put Array^
 A: $fu->fin('FormDBa1.tdb', {binary=>1})^
 E: $fu->fin('FormDBa4.tdb', {binary=>1})^
ok: 12^


 C:
    #######
    # Test the strict binary format.
    #
    unlink 'FormDBa1.tdb';
    unlink 'FormDBh1.tdb';
    unlink 'FormDBr1.txt';
    unlink 'FormDBa1.txt';
^


See_Also: L<DataPort::FileType::FormDB>^

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
^

HTML: ^


~-~
