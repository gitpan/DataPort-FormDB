#!perl
#
#
use 5.001;
use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE);
$VERSION = '0.03';   # automatically generated file
$DATE = '2003/06/23';


##### Demonstration Script ####
#
# Name: FormDB.d
#
# UUT: DataPort::FileType::FormDB
#
# The module Test::STDmaker generated this demo script from the contents of
#
# t::DataPort::FormDB 
#
# Don't edit this test script file, edit instead
#
# t::DataPort::FormDB
#
#	ANY CHANGES MADE HERE TO THIS SCRIPT FILE WILL BE LOST
#
#       the next time Test::STDmaker generates this script file.
#
#

######
#
# The working directory is the directory of the generated file
#
use vars qw($__restore_dir__);

BEGIN {
    use Cwd;
    use File::Spec;
    use File::FileUtil
    use Test::Tech qw(tech_config plan demo);

    ########
    # Working directory is that of the script file
    #
    $__restore_dir__ = cwd();
    my ($vol, $dirs, undef) = File::Spec->splitpath( $0 );
    chdir $vol if $vol;
    chdir $dirs if $dirs;

    #######
    # Add the library of the unit under test (UUT) to @INC
    #
    @__restore_inc__ = File::FileUtil->test_lib2inc();

    unshift @INC, File::Spec->catdir( cwd(), 'lib' ); 

}

END {

   #########
   # Restore working directory and @INC back to when enter script
   #
   @INC = @__restore_inc__;
   chdir $__restore_dir__;

}

print << 'MSG';

 ~~~~~~ Demonstration overview ~~~~~
 
Perl code begins with the prompt

 =>

The selected results from executing the Perl Code 
follow on the next lines. For example,

 => 2 + 2
 4

 ~~~~~~ The demonstration follows ~~~~~

MSG

demo( "\ \ \ \ use\ File\:\:FileUtil\;\
\ \ \ \ my\ \$fu\ \=\ \'File\:\:FileUtil\'\;"); # typed in command           
          use File::FileUtil;
    my $fu = 'File::FileUtil';; # execution

demo( "my\ \$errors\ \=\ \$fu\-\>load_package\(\ \'DataPort\:\:FileType\:\:FormDB\'\ \)"); # typed in command           
      my $errors = $fu->load_package( 'DataPort::FileType::FormDB' ); # execution

demo( "\$errors", # typed in command           
      $errors # execution
) unless     $loaded; # condition for execution                            

demo( "\$fu\-\>fin\(\ \'FormDB0\.tdb\'\ \)", # typed in command           
      $fu->fin( 'FormDB0.tdb' )); # execution


demo( "\ \ \ \ \#\#\#\#\#\#\#\
\ \ \ \ \#\ Test\ the\ lenient\ format\.\
\ \ \ \ \#\
\ \ \ \ unlink\ \'FormDBa1\.tdb\'\;\
\ \ \ \ unlink\ \'FormDBr1\.txt\'\;\
\ \ \ \ unlink\ \'FormDBa1\.txt\'\;\
\
\ \ \ \ my\ \$dbh_in\ \=\ new\ DataPort\:\:FileType\:\:FormDB\(flag\=\>\'\<\'\,\ file\=\>\'FormDB0\.tdb\'\)\;\
\ \ \ \ my\ \$dbh_out\ \=\ new\ DataPort\:\:FileType\:\:FormDB\(flag\=\>\'\>\'\,\ file\=\>\'FormDBa1\.tdb\'\)\;\
\
\ \ \ \ my\ \(\$record\,\$fields\)\ \=\ \(\'\'\,\'\'\)\;\
\ \ \ \ my\ \(\$\$record_p\,\ \$\$fields_p\)\ \=\ \(\\\$record\,\\\$fields\)\;\
\
\ \ \ \ my\ \$array_p\ \=\ \[\]\;\
\ \ \ \ while\(\ \$dbh_in\-\>get_record\(\$record_p\)\ \)\ \{\
\ \ \ \ \ \ \ \ \$dbh_in\-\>decode_record\(\$record_p\,\$fields_p\)\;\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'FormDBr1\.txt\'\,\$\$fields_p\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\ \)\;\
\ \ \ \ \ \ \ \ \$dbh_in\-\>decode_field\(\$fields_p\,\ \$array_p\)\;\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'FormDBa1\.txt\'\,join\(\"\\n\"\,\@\$array_p\)\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\)\;\
\ \ \ \ \ \ \ \ \(\$\$record_p\,\ \$\$fields_p\)\ \=\ \(\'\'\,\'\'\)\;\
\ \ \ \ \ \ \ \ \$dbh_out\-\>encode_field\(\ \$array_p\,\ \$fields_p\ \)\;\
\ \ \ \ \ \ \ \ \$dbh_out\-\>encode_record\(\ \$fields_p\,\ \$record_p\)\;\
\ \ \ \ \ \ \ \ \$dbh_out\-\>put_record\(\$record_p\)\;\
\ \ \ \ \ \ \ \ \(\$\$record_p\,\ \$\$fields_p\)\ \=\ \(\'\'\,\'\'\)\;\
\ \ \ \ \}\
\
\ \ \ \ \$dbh_out\-\>finish\(\)\;\
\ \ \ \ \$dbh_in\-\>finish\(\)\;"); # typed in command           
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
    $dbh_in->finish();; # execution

demo( "\$fu\-\>fin\(\'FormDBr1\.txt\'\)", # typed in command           
      $fu->fin('FormDBr1.txt')); # execution


demo( "\$fu\-\>fin\(\'FormDBa1\.txt\'\)", # typed in command           
      $fu->fin('FormDBa1.txt')); # execution


demo( "\$fu\-\>fin\(\'FormDBa1\.tdb\'\)", # typed in command           
      $fu->fin('FormDBa1.tdb')); # execution


demo( "\$fu\-\>fin\(\ \'FormDBs0\.tdb\'\ \)", # typed in command           
      $fu->fin( 'FormDBs0.tdb' )); # execution


demo( "\ \ \ \ \#\#\#\#\#\#\#\
\ \ \ \ \#\ Test\ the\ strict\ format\.\
\ \ \ \ \#\
\ \ \ \ unlink\ \'FormDBa1\.tdb\'\;\
\ \ \ \ unlink\ \'FormDBr1\.txt\'\;\
\ \ \ \ unlink\ \'FormDBa1\.txt\'\;\
\
\ \ \ \ \$dbh_in\ \=\ new\ DataPort\:\:FileType\:\:FormDB\(flag\=\>\'\<\'\,\ file\=\>\'FormDBs0\.tdb\'\,\ strict\=\>1\)\;\
\ \ \ \ \$dbh_out\ \=\ new\ DataPort\:\:FileType\:\:FormDB\(flag\=\>\'\>\'\,\ file\=\>\'FormDBa1\.tdb\'\,\ strict\=\>1\)\;\
\
\ \ \ \ \(\$\$record_p\,\ \$\$fields_p\)\ \=\ \(\'\'\,\'\'\)\;\
\ \ \ \ while\(\ \$dbh_in\-\>get_record\(\$record_p\)\ \)\ \{\
\ \ \ \ \ \ \ \ \$dbh_in\-\>decode_record\(\$record_p\)\;\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'FormDBr1\.txt\'\,\$\$record_p\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\ \)\;\
\ \ \ \ \ \ \ \ \$dbh_in\-\>decode_field\(\$record_p\,\ \$array_p\)\;\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'FormDBa1\.txt\'\,join\(\"\\n\"\,\@\$array_p\)\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\)\;\
\ \ \ \ \ \ \ \ \(\$\$record_p\,\ \$\$fields_p\)\ \=\ \(\'\'\,\'\'\)\;\
\ \ \ \ \ \ \ \ \$dbh_out\-\>encode_field\(\ \$array_p\,\ \$record_p\ \)\;\
\ \ \ \ \ \ \ \ \$dbh_out\-\>encode_record\(\$record_p\)\;\
\ \ \ \ \ \ \ \ \$dbh_out\-\>put_record\(\$record_p\)\;\
\ \ \ \ \ \ \ \ \(\$\$record_p\,\ \$\$fields_p\)\ \=\ \(\'\'\,\'\'\)\;\
\ \ \ \ \}\
\
\
\ \ \ \ \$dbh_out\-\>finish\(\)\;\
\ \ \ \ \$dbh_in\-\>finish\(\)\;"); # typed in command           
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
    $dbh_in->finish();; # execution

demo( "\$fu\-\>fin\(\'FormDBr1\.txt\'\)", # typed in command           
      $fu->fin('FormDBr1.txt')); # execution


demo( "\$fu\-\>fin\(\'FormDBa1\.txt\'\)", # typed in command           
      $fu->fin('FormDBa1.txt')); # execution


demo( "\$fu\-\>fin\(\'FormDBa1\.tdb\'\)", # typed in command           
      $fu->fin('FormDBa1.tdb')); # execution


demo( "\ \ \ \ \#\#\#\#\#\#\#\
\ \ \ \ \#\ Test\ the\ strict\ binary\ format\.\
\ \ \ \ \#\
\ \ \ \ unlink\ \'FormDBa1\.tdb\'\;\
\ \ \ \ unlink\ \'FormDBh1\.tdb\'\;\
\ \ \ \ unlink\ \'FormDBr1\.txt\'\;\
\ \ \ \ unlink\ \'FormDBa1\.txt\'\;\
\
\ \ \ \ \$dbh_in\ \=\ new\ DataPort\:\:FileType\:\:FormDB\(flag\=\>\'\<\'\,\ file\=\>\'FormDBs0\.tdb\'\,\ strict\=\>1\,\ binary\=\>1\)\;\
\ \ \ \ \$dbh_out\ \=\ new\ DataPort\:\:FileType\:\:FormDB\(flag\=\>\'\>\'\,\ file\=\>\'FormDBa1\.tdb\'\,\ strict\=\>1\,\ binary\=\>1\)\;\
\
\ \ \ \ \(\$\$record_p\,\ \$\$fields_p\)\ \=\ \(\'\'\,\'\'\)\;\
\ \ \ \ while\(\ \$dbh_in\-\>get_record\(\$record_p\)\ \)\ \{\
\ \ \ \ \ \ \ \ \$dbh_in\-\>decode_record\(\$record_p\,\ \$record_p\)\;\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'FormDBr1\.txt\'\,\$\$record_p\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\ \)\;\
\ \ \ \ \ \ \ \ \$dbh_in\-\>decode_field\(\$record_p\,\ \$array_p\)\;\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'FormDBa1\.txt\'\,join\(\"\\n\"\,\@\$array_p\)\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\)\;\
\ \ \ \ \ \ \ \ \(\$\$record_p\,\ \$\$fields_p\)\ \=\ \(\'\'\,\'\'\)\;\
\ \ \ \ \ \ \ \ \$dbh_out\-\>encode_field\(\ \$array_p\,\ \$record_p\ \)\;\
\ \ \ \ \ \ \ \ \$dbh_out\-\>encode_record\(\ \$record_p\,\ \$record_p\)\;\
\ \ \ \ \ \ \ \ \$dbh_out\-\>put_record\(\$record_p\)\;\
\ \ \ \ \ \ \ \ \(\$\$record_p\,\ \$\$fields_p\)\ \=\ \(\'\'\,\'\'\)\;\
\ \ \ \ \}\
\
\ \ \ \ \$dbh_out\-\>finish\(\)\;\
\ \ \ \ \$dbh_in\-\>finish\(\)\;"); # typed in command           
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
    $dbh_in->finish();; # execution

demo( "\$fu\-\>fin\(\'FormDBr1\.txt\'\,\ \{binary\=\>1\}\)", # typed in command           
      $fu->fin('FormDBr1.txt', {binary=>1})); # execution


demo( "\$fu\-\>fin\(\'FormDBa1\.txt\'\,\ \{binary\=\>1\}\)", # typed in command           
      $fu->fin('FormDBa1.txt', {binary=>1})); # execution


demo( "\$fu\-\>fin\(\'FormDBa1\.tdb\'\,\ \{binary\=\>1\}\)", # typed in command           
      $fu->fin('FormDBa1.tdb', {binary=>1})); # execution


demo( "\ \ \ \ \#\#\#\#\#\#\#\
\ \ \ \ \#\ Test\ the\ strict\ binary\ format\.\
\ \ \ \ \#\
\ \ \ \ unlink\ \'FormDBa1\.tdb\'\;\
\ \ \ \ unlink\ \'FormDBh1\.tdb\'\;\
\ \ \ \ unlink\ \'FormDBr1\.txt\'\;\
\ \ \ \ unlink\ \'FormDBa1\.txt\'\;"); # typed in command           
          #######
    # Test the strict binary format.
    #
    unlink 'FormDBa1.tdb';
    unlink 'FormDBh1.tdb';
    unlink 'FormDBr1.txt';
    unlink 'FormDBa1.txt';; # execution


=head1 NAME

FormDB.d - demostration script for DataPort::FileType::FormDB

=head1 SYNOPSIS

 FormDB.d

=head1 OPTIONS

None.

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

## end of test script file ##

=cut

