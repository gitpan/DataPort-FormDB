#!perl
#
#
use 5.001;
use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE);
$VERSION = '0.02';   # automatically generated file
$DATE = '2003/06/21';


##### Demonstration Script ####
#
# Name: DataFile.d
#
# UUT: DataPort::DataFile
#
# The module Test::STDmaker generated this demo script from the contents of
#
# DataPort::DataFile::DataFile 
#
# Don't edit this test script file, edit instead
#
# DataPort::DataFile::DataFile
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
    use Test::Tech qw(tech_config plan demo);

    ########
    # Working directory is that of the script file
    #
    $__restore_dir__ = cwd();
    my ($vol, $dirs, undef) = File::Spec->splitpath( $0 );
    chdir $vol if $vol;
    chdir $dirs if $dirs;
}

END {

    #########
    # Restore working directory back to when enter script
    #
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

demo( "my\ \$errors\ \=\ \$fu\-\>load_package\(\ \'DataPort\:\:DataFileI\'\ \)"); # typed in command           
      my $errors = $fu->load_package( 'DataPort::DataFileI' ); # execution

demo( "\$errors", # typed in command           
      $errors # execution
) unless     $loaded; # condition for execution                            

demo( "\$fu\-\>fin\(\ \'DataFile0\.tdb\'\ \)", # typed in command           
      $fu->fin( 'DataFile0.tdb' )); # execution


demo( "\ \ \ \ unlink\ \'DataFile1\.txt\'\;\
\
\ \ \ \ my\ \$record\;\
\ \ \ \ my\ \(\$array_p\,\ \$record_p\)\ \=\ \(\[\]\,\ \\\$record\)\;\
\ \ \ \ my\ \$dbh\ \=\ new\ DataPort\:\:DataFileI\(flag\ \=\>\ \'\<\'\,\ file\ \=\>\ \'DataFile0\.tdb\'\,\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ option1\ \=\>\ \'1\'\,\ option2\ \=\>\ \'2\'\ \)\;\
\
\ \ \ \ while\(\ \$dbh\-\>get\(\$array_p\,\ \$record_p\)\ \)\ \{\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'DataFile1\.txt\'\,\ \$\$record_p\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\)\;\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'DataFile1\.txt\'\,\ join\(\"\\n\+\-\-\\n\"\,\@\$array_p\)\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\)\;\
\ \ \ \ \}"); # typed in command           
          unlink 'DataFile1.txt';

    my $record;
    my ($array_p, $record_p) = ([], \$record);
    my $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
               option1 => '1', option2 => '2' );

    while( $dbh->get($array_p, $record_p) ) {
        $fu->fout( 'DataFile1.txt', $$record_p . "\n~-~\n", {append=>1});
        $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~-~\n", {append=>1});
    }; # execution

demo( "\$fu\-\>fin\(\'DataFile1\.txt\'\)", # typed in command           
      $fu->fin('DataFile1.txt')); # execution


demo( "\ \ \ \ unlink\ \'DataFile1\.txt\'\;\
\ \ \ \ \$dbh\-\>finish\(\)\;\
\
\ \ \ \ \$dbh\ \=\ new\ DataPort\:\:DataFileI\(flag\ \=\>\ \'\<\'\,\ file\ \=\>\ \'DataFile0\.tdb\'\,\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ option3\ \=\>\ \'3\'\,\ option4\ \=\>\ \'4\'\,\ \ option5\ \=\>\ \'5\'\ \)\;\
\
\ \ \ \ while\(\ \$dbh\-\>get\(\$array_p\)\ \)\ \{\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'DataFile1\.txt\'\,\ join\(\"\\n\+\-\-\\n\"\,\@\$array_p\)\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\)\;\
\ \ \ \ \}\
\ \ \ \ \$dbh\-\>finish\(\)\;"); # typed in command           
          unlink 'DataFile1.txt';
    $dbh->finish();

    $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
               option3 => '3', option4 => '4',  option5 => '5' );

    while( $dbh->get($array_p) ) {
        $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~-~\n", {append=>1});
    }
    $dbh->finish();; # execution

demo( "\$fu\-\>fin\(\'DataFile1\.txt\'\)", # typed in command           
      $fu->fin('DataFile1.txt')); # execution


demo( "\ \ \ \ unlink\ \'DataFile1\.txt\'\;\
\ \ \ \ unlink\ \'DataFile1\.tdb\'\;\
\
\ \ \ \ \$dbh\ \=\ new\ DataPort\:\:DataFileI\(flag\ \=\>\ \'\>\'\,\ file\ \=\>\ \'DataFile1\.tdb\'\,\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ option6\ \=\>\ \'6\'\,\ option7\ \=\>\ \'7\'\ \)\;\
\
\ \ \ \ my\ \@db\ \=\ \(\ \[\ \'name1\'\,\'data1\'\,\'name2\'\,\'data2\'\]\,\ \[\ \'name3\'\,\ \'data3\'\,\ \'name4\'\,\ \'data4\'\ \]\ \)\;\ \ \
\ \
\ \ \ \ foreach\ \$array_p\ \(\@db\)\ \{\
\ \ \ \ \ \ \ \ \$record\ \=\ \'\'\;\ \
\ \ \ \ \ \ \ \ \$dbh\-\>put\(\$array_p\,\ \$record_p\)\;\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\'DataFile1\.txt\'\,\ \$\$record_p\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\)\;\
\ \ \ \ \}\
\ \ \ \ \$dbh\-\>finish\(\)\;"); # typed in command           
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
    $dbh->finish();; # execution

demo( "\$fu\-\>fin\(\'DataFile1\.tdb\'\)", # typed in command           
      $fu->fin('DataFile1.tdb')); # execution


demo( "\$fu\-\>fin\(\'DataFile1\.txt\'\)", # typed in command           
      $fu->fin('DataFile1.txt')); # execution


demo( "\ \ \ \ \$dbh\-\>finish\(\)\;\
\ \ \ \ unlink\ \'DataFile1\.txt\'\;\
\ \ \ \ unlink\ \'DataFile1\.tdb\'\;\
\
\ \ \ \ \$dbh\ \=\ new\ DataPort\:\:DataFileI\(flag\ \=\>\ \'\>\'\,\ file\ \=\>\ \'DataFile1\.tdb\'\,\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ option8\ \=\>\ \'8\'\ \)\;\
\
\ \ \ \ \@db\ \=\ \(\ \[\ \'name5\'\,\'data5\'\,\'name6\'\,\'data6\'\]\,\ \[\ \'name7\'\,\ \'data7\'\ \]\ \)\;\ \ \
\ \
\ \ \ \ foreach\ \$array_p\ \(\@db\)\ \{\ \
\ \ \ \ \ \ \ \ \$dbh\-\>put\(\$array_p\)\;\
\ \ \ \ \}\
\ \ \ \ \$dbh\-\>finish\(\)\;"); # typed in command           
          $dbh->finish();
    unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '>', file => 'DataFile1.tdb',
               option8 => '8' );

    @db = ( [ 'name5','data5','name6','data6'], [ 'name7', 'data7' ] );  
 
    foreach $array_p (@db) { 
        $dbh->put($array_p);
    }
    $dbh->finish();; # execution

demo( "\$fu\-\>fin\(\'DataFile1\.tdb\'\)", # typed in command           
      $fu->fin('DataFile1.tdb')); # execution


demo( "\ \ \ \ unlink\ \'DataFile1\.txt\'\;\
\ \ \ \ unlink\ \'DataFile1\.tdb\'\;\
\
\ \ \ \ \$dbh\ \=\ new\ DataPort\:\:DataFileI\(flag\ \=\>\ \'\>\'\,\ file\ \=\>\ \'DataFile1\.tdb\'\,\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ binary\ \=\>\ 1\,\ option9\ \=\>\ \'9\'\ \)\;\
\
\ \ \ \ \@db\ \=\ \(\ \[\ \'name5\'\,\'data5\'\,\'name6\'\,\'data6\'\]\,\ \[\ \'name7\'\,\ \'data7\'\ \]\ \)\;\ \ \
\ \
\ \ \ \ foreach\ \$array_p\ \(\@db\)\ \{\ \
\ \ \ \ \ \ \ \ \$dbh\-\>put\(\$array_p\)\;\
\ \ \ \ \}\
\ \ \ \ \$dbh\-\>finish\(\)\;"); # typed in command           
          unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '>', file => 'DataFile1.tdb',
              binary => 1, option9 => '9' );

    @db = ( [ 'name5','data5','name6','data6'], [ 'name7', 'data7' ] );  
 
    foreach $array_p (@db) { 
        $dbh->put($array_p);
    }
    $dbh->finish();; # execution

demo( "\$fu\-\>fin\(\'DataFile1\.tdb\'\)", # typed in command           
      $fu->fin('DataFile1.tdb')); # execution


demo( "\ \ \ \ unlink\ \'DataFile1\.txt\'\;\
\ \ \ \ unlink\ \'DataFile1\.tdb\'\;\
\
\ \ \ \ \$dbh\ \=\ new\ DataPort\:\:DataFileI\(flag\ \=\>\ \'\<\'\,\ file\ \=\>\ \'DataFile0\.tdb\'\,\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ binary\ \=\>\ 1\,\ option10\ \=\>\ \'10\'\,\ option11\ \=\>\ \'11\'\ \)\;\
\
\ \ \ \ while\(\ \$dbh\-\>get\(\$array_p\,\ \$record_p\)\ \)\ \{\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'DataFile1\.txt\'\,\ \$\$record_p\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\)\;\
\ \ \ \ \ \ \ \ \$fu\-\>fout\(\ \'DataFile1\.txt\'\,\ join\(\"\\n\+\-\-\\n\"\,\@\$array_p\)\ \.\ \"\\n\~\-\~\\n\"\,\ \{append\=\>1\}\)\;\
\ \ \ \ \}\
\ \ \ \ \$dbh\-\>finish\(\)\;"); # typed in command           
          unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';

    $dbh = new DataPort::DataFileI(flag => '<', file => 'DataFile0.tdb',
               binary => 1, option10 => '10', option11 => '11' );

    while( $dbh->get($array_p, $record_p) ) {
        $fu->fout( 'DataFile1.txt', $$record_p . "\n~-~\n", {append=>1});
        $fu->fout( 'DataFile1.txt', join("\n+--\n",@$array_p) . "\n~-~\n", {append=>1});
    }
    $dbh->finish();; # execution

demo( "\$fu\-\>fin\(\'DataFile1\.txt\'\)", # typed in command           
      $fu->fin('DataFile1.txt')); # execution


demo( "\ \ \ \ unlink\ \'DataFile1\.txt\'\;\
\ \ \ \ unlink\ \'DataFile1\.tdb\'\;"); # typed in command           
          unlink 'DataFile1.txt';
    unlink 'DataFile1.tdb';; # execution


=head1 NAME

DataFile.d - demostration script for DataPort::DataFile

=head1 SYNOPSIS

 DataFile.d

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

## end of test script file ##

=cut

