#!perl
#
# The copyright notice and plain old documentation (POD)
# are at the end of this file.
#
package  Docs::Site_SVD::DataPort_FormDB;

use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE $FILE );
$VERSION = '0.04';
$DATE = '2003/06/21';
$FILE = __FILE__;

use vars qw(%INVENTORY);
%INVENTORY = (
    'lib/Docs/Site_SVD/DataPort_FormDB.pm' => [qw(0.04 2003/06/21), 'revised 0.03'],
    'MANIFEST' => [qw(0.04 2003/06/21), 'generated, replaces 0.03'],
    'Makefile.PL' => [qw(0.04 2003/06/21), 'generated, replaces 0.03'],
    'README' => [qw(0.04 2003/06/21), 'generated, replaces 0.03'],
    'lib/DataPort/DataFile.pm' => [qw(0.01 2003/06/08), 'unchanged'],
    'lib/DataPort/DataFileI.pm' => [qw(0.01 2003/06/08), 'unchanged'],
    'lib/DataPort/FileType/FormDB.pm' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile.d' => [qw(0.02 2003/06/21), 'revised 0.01'],
    't/DataPort/DataFile.pm' => [qw(0.01 2003/06/21), 'new'],
    't/DataPort/DataFile.t' => [qw(0.04 2003/06/21), 'revised 0.03'],
    't/DataPort/DataFile0.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile2.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile2.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile3.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile3.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile4.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile4.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile5.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDB.d' => [qw(0.02 2003/06/21), 'revised 0.01'],
    't/DataPort/FormDB.pm' => [qw(0.01 2003/06/21), 'new'],
    't/DataPort/FormDB.t' => [qw(0.04 2003/06/21), 'revised 0.03'],
    't/DataPort/FormDB0.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBa2.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBa2.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBa3.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBa3.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBa4.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBa4.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBr2.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBr3.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBr4.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDBs0.tdb' => [qw(0.01 2003/06/08), 'unchanged'],

);

########
# The SVD::SVDmaker module uses the data after the __DATA__ 
# token to automatically generate the this file.
#
# Don't edit anything before __DATA_. Edit instead
# the data after the __DATA__ token.
#
# ANY CHANGES MADE BEFORE the  __DATA__ token WILL BE LOST
#
# the next time SVD::SVDmaker generates this file.
#
#



=head1 Title Page

 Software Version Description

 for

 DataPort::FilteType::FormDB - Text Form Datatbase with advantages over CSV

 Revision: B

 Version: 0.04

 Date: 2003/06/21

 Prepared for: General Public 

 Prepared by:  SoftwareDiamonds.com E<lt>support@SoftwareDiamonds.comE<gt>

 Copyright: copyright © 2003 Software Diamonds

 Classification: NONE

=head1 1.0 SCOPE

This paragraph identifies and provides an overview
of the released files.

=head2 1.1 Indentification

This release is a collection of Perl modules that
extend the capabilities of the Perl language.

=head2 1.2 System overview

The system is the Perl programming language software.
The system does not have any hardware.
The Perl programming language contains two features that
are utilized by this release:

=over 4

=item 1

Program Modules to extend the languages

=item 2

Plain Old Documentation (POD) that may be embedded in the language

=back

These features are established by the referenced documents.

The system is the Perl programming language software.
As established by the Perl referenced documents,
program modules, such the "DataPort::*" modules, extend the Perl language.

The "DataPort::*" program modules accesses different types of
data sources in different formats
and streams them to a stanadard pure Perl API. 

The feature data source is the text base FormDB. 
The FormDB data source has improve flexability and
performance over other text base formats such as the Comma Separated
Variable (CSV) format.

The text format resembles as much as possible the standard hard copy forms.
An example of a "L<DatatPort::FIleType::FormDB|DatatPort::FIleType::FormDB>
record follows:

 manhood length: ________ ^
 time spent in big house: _________ ^

 what drugs do you use:
 _________ 
 _________ 

 ^

 ~-~

The ':' separates field names and field content.
The '^' tags the end of a field and the '~-~' tags the
end of the record.
The separation sequences are escaped within the form
by adding an extra character as follows:

  sequence  escaped
  --------  --------
  ~-~       ~--~
  ~--~      ~---~
  ^         ^^
  ^^        ^^^
  :         :
  ::        :::

Since ~-~ never appears inside a record, Perl can very
easily find the record separators just by ... well ...
searching for it. The search for the end of field
and end of field name are just a little bit more 
complicated. Search for a  ':' or '^' all by itself.
Escaping and unescaping is just adding one more
':', '^', '-' or removing one of these characters.

The FormDB record looks very much like a hard copy 
form yet is very simple and straight forward for
Perl or any other programming language to process.

The DataPort::FileType::FormDB module is an integral part of the
US DOD SDT2167A bundle of modules.
The data used by Test::STDmaker and ExtUtils::SVDmaker are
stored in this format.

The dependency of the program modules in the US DOD STD2167A bundle is as follows:
 
 File::FileUtil 
   Test::STD::Scrub
     Test::Tech
        DataPort::FileType::FormDB DataPort::DataFile Test::STD::STDutil
            Test::STDmaker ExtUtils::SVDmaker

Note the 
L<File::FileUtil|File::FileUtil>, 
L<Test::STD::STDutil|Test::STD::STDutil> 
L<Test::STD::Scrub|Test::STD::Scrub> 
program modules breaks up 
the Test::TestUtil program module
and Test::TestUtil has disappeared.

=head2 1.3 Document overview.

This document releases DataPort::FormDB version 0.04
providing description of the inventory, installation
instructions and other information necessary to
utilize and track this release.

=head1 3.0 VERSION DESCRIPTION

All file specifications in this SVD
use the Unix operating
system file specification.

=head2 3.1 Inventory of materials released.

=head2 3.1.1 Files.

This document releases the file found
at the following repository:

   http://www.softwarediamonds/packages/DataPort-FormDB-0.04
   http://www.perl.com/CPAN-local/authors/id/S/SO/SOFTDIA/DataPort-FormDB-0.04


=head2 3.1.2 Copyright.

copyright © 2003 Software Diamonds

=head2 3.1.3 Copyright holder contact.

 603 882-0846 E<lt>support@SoftwareDiamonds.comE<gt>

=head2 3.1.4 License.

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

=head2 3.2 Inventory of software contents

The content of the released, compressed, archieve file,
consists of the following files:

 file                                                         version date       comment
 ------------------------------------------------------------ ------- ---------- ------------------------
 lib/Docs/Site_SVD/DataPort_FormDB.pm                         0.04    2003/06/21 revised 0.03
 MANIFEST                                                     0.04    2003/06/21 generated, replaces 0.03
 Makefile.PL                                                  0.04    2003/06/21 generated, replaces 0.03
 README                                                       0.04    2003/06/21 generated, replaces 0.03
 lib/DataPort/DataFile.pm                                     0.01    2003/06/08 unchanged
 lib/DataPort/DataFileI.pm                                    0.01    2003/06/08 unchanged
 lib/DataPort/FileType/FormDB.pm                              0.01    2003/06/08 unchanged
 t/DataPort/DataFile.d                                        0.02    2003/06/21 revised 0.01
 t/DataPort/DataFile.pm                                       0.01    2003/06/21 new
 t/DataPort/DataFile.t                                        0.04    2003/06/21 revised 0.03
 t/DataPort/DataFile0.tdb                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile2.tdb                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile2.txt                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile3.tdb                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile3.txt                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile4.tdb                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile4.txt                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile5.txt                                     0.01    2003/06/08 unchanged
 t/DataPort/FormDB.d                                          0.02    2003/06/21 revised 0.01
 t/DataPort/FormDB.pm                                         0.01    2003/06/21 new
 t/DataPort/FormDB.t                                          0.04    2003/06/21 revised 0.03
 t/DataPort/FormDB0.tdb                                       0.01    2003/06/08 unchanged
 t/DataPort/FormDBa2.tdb                                      0.01    2003/06/08 unchanged
 t/DataPort/FormDBa2.txt                                      0.01    2003/06/08 unchanged
 t/DataPort/FormDBa3.tdb                                      0.01    2003/06/08 unchanged
 t/DataPort/FormDBa3.txt                                      0.01    2003/06/08 unchanged
 t/DataPort/FormDBa4.tdb                                      0.01    2003/06/08 unchanged
 t/DataPort/FormDBa4.txt                                      0.01    2003/06/08 unchanged
 t/DataPort/FormDBr2.txt                                      0.01    2003/06/08 unchanged
 t/DataPort/FormDBr3.txt                                      0.01    2003/06/08 unchanged
 t/DataPort/FormDBr4.txt                                      0.01    2003/06/08 unchanged
 t/DataPort/FormDBs0.tdb                                      0.01    2003/06/08 unchanged


=head2 3.3 Changes

Changed the name of "Test::Tester" to "Test::Tech".
The name "Test::Tester" is taken on CPAN as an upload.

Broke up the STD support utilities "Test::TestUtil"
into "File::FileUtil", "Test::STD::Scrub" and
"Test::STD::STDutil"

Theses changes impacted the test software.

Changes to previous revisions are as follows:

=over 4

=item DataPort_FormDB 0.01

Originated

=item DataPort_FormDB 0.02

At 04:10 AM 6/9/2003 +0000, Josts Smokehouse wrote:

Hello, Samson Monaco Tutankhamen! Thanks for uploading your works to CPAN.

I noticed that the test suite seem to fail without these modules:

STD::Tester

As such, adding the prerequisite module(s) to 'PREREQ_PM' in your
Makefile.PL should solve this problem.  For example:


 WriteMakefile(
    AUTHOR      => 'Samson Monaco Tutankhamen (support@SoftwareDiamonds.com)',
    ... # other information
    PREREQ_PM   => {
        'STD::Tester'   => '0', # or a minimum workable version
    }
 );


If you are interested in making a more flexible Makefile.PL that can
probe for missing dependencies and install them, ExtUtils::AutoInstall
at <http://search.cpan.org/search?dist=ExtUtils-AutoInstall> may be
worth a look.

Thanks! :-)

~~~~~~~~~~~~~~~~~

CORRECTIVE ACTION:

The Makefile.PL is automatically generated by ExtUtils::SVDmaker
from the data stored in the DataPort::FileType::FormDB format
in the Docs::Site_SVD::DataPort-FormDB module.
For now, in Docs::Site_SVD::DataPort-FormDB

Changed 

 PREREQ_PM: ^

to

 PREREQ_PM:
 'Test::TestUtil' => 0,
 'Test::Tester' => 0,
 ^

and regenerated the distribution using ExtUtils::SVDmaker

Uploaded Test::TestUtil and Test::Tester to CPAN in order to 
resolve the prerequiste.

=item DataPort_FormDB 0.03

Resolved a CPAN namespace conflict by changing the name
of Test::Tester to Test::Tech.

=back

=head2 3.4 Adaptation data.

This installation requires that the installation site
has the Perl programming language installed.
Installation sites running Microsoft Operating systems require
the installation of Unix utilities. 
An excellent, highly recommended Unix utilities for Microsoft
operating systems is unxutils by Karl M. Syring.
A copy is available at the following web sites:

 http://unxutils.sourceforge.net
 http://packages.SoftwareDiamnds.com

There are no other additional requirements or tailoring needed of 
configurations files, adaptation data or other software needed for this
installation particular to any installation site.

=head2 3.5 Related documents.

There are no related documents needed for the installation and
test of this release.

=head2 3.6 Installation instructions.

To installed the release file, use the CPAN module in the Perl release
or the INSTALL.PL script at the following web site:

 http://packages.SoftwareDiamonds.com

Follow the instructions for the the chosen installation software.

The distribution file is at the following respositories:

   http://www.softwarediamonds/packages/DataPort-FormDB-0.04
   http://www.perl.com/CPAN-local/authors/id/S/SO/SOFTDIA/DataPort-FormDB-0.04


=head2 3.6.1 Installation support.

If there are installation problems or questions with the installation
contact

 603 882-0846 E<lt>support@SoftwareDiamonds.comE<gt>

=head2 3.6.2 Installation Tests.

Most Perl installation software will run the following test script(s)
as part of the installation:

 t/DataPort/FormDB.t
 t/DataPort/DataFile.t

=head2 3.7 Possible problems and known errors

There are no known open issues.

=head1 4.0 NOTES

The following are useful acronyms:

=over 4

=item .d

extension for a Perl demo script file

=item .pm

extension for a Perl Library Module

=item .t

extension for a Perl test script file

=item DID

Data Item Description

=item POD

Plain Old Documentation

=item SVD

Software Version Description

=back

=head1 2.0 SEE ALSO

Modules with end-user functional interfaces 
relating to US DOD 2167A automation are
as follows:

=over 4

=item L<Test::STDmaker|Test::STDmaker>

=item L<ExtUtils::SVDmaker|ExtUtils::SVDmaker>

=item L<DataPort::FileType::FormDB|DataPort::FileType::FormDB>

=item L<DataPort::DataFile|DataPort::DataFile>

=item L<Test::Tech|Test::Tech>

=item L<Test|Test>

=item L<Data::Dumper|Data::Dumper>

=item L<Test::STD::Scrub|Test::STD::Scrub>

=item L<Test::STD::STDutil|Test::STD::STDutil>

=item L<File::FileUtil|File::FileUtil>

=back

The design modules for L<Test::STDmaker|Test::STDmaker>
have no other conceivable use then to support the
L<Test::STDmaker|Test::STDmaker> functional interface. 
The  L<Test::STDmaker|Test::STDmaker>
design module are as follows:

=over 4

=item L<Test::STD::Check|Test::STD::Check>

=item L<Test::STD::FileGen|Test::STD::FileGen>

=item L<Test::STD::STD2167|Test::STD::STD2167>

=item L<Test::STD::STDgen|Test::STD::STDgen>

=item L<Test::STDtype::Demo|Test::STDtype::Demo>

=item L<Test::STDtype::STD|Test::STDtype::STD>

=item L<Test::STDtype::Verify|Test::STDtype::Verify>

=back


Some US DOD 2167A Software Development Standard, DIDs and
other related documents that complement the 
US DOD 2167A automation are as follows:

=over 4

=item L<US DOD Software Development Standard|Docs::US_DOD::STD2167A>

=item L<US DOD Specification Practices|Docs::US_DOD::STD490A>

=item L<Computer Operation Manual (COM) DID|Docs::US_DOD::COM>

=item L<Computer Programming Manual (CPM) DID)|Docs::US_DOD::CPM>

=item L<Computer Resources Integrated Support Document (CRISD) DID|Docs::US_DOD::CRISD>

=item L<Computer System Operator's Manual (CSOM) DID|Docs::US_DOD::CSOM>

=item L<Database Design Description (DBDD) DID|Docs::US_DOD::DBDD>

=item L<Engineering Change Proposal (ECP) DID|Docs::US_DOD::ECP>

=item L<Firmware support Manual (FSM) DID|Docs::US_DOD::FSM>

=item L<Interface Design Document (IDD) DID|Docs::US_DOD::IDD>

=item L<Interface Requirements Specification (IRS) DID|Docs::US_DOD::IRS>

=item L<Operation Concept Description (OCD) DID|Docs::US_DOD::OCD>

=item L<Specification Change Notice (SCN) DID|Docs::US_DOD::SCN>

=item L<Software Design Specification (SDD) DID|Docs::US_DOD::SDD>

=item L<Software Development Plan (SDP) DID|Docs::US_DOD::SDP> 

=item L<Software Input and Output Manual (SIOM) DID|Docs::US_DOD::SIOM>

=item L<Software Installation Plan (SIP) DID|Docs::US_DOD::SIP>

=item L<Software Programmer's Manual (SPM) DID|Docs::US_DOD::SPM>

=item L<Software Product Specification (SPS) DID|Docs::US_DOD::SPS>

=item L<Software Requirements Specification (SRS) DID|Docs::US_DOD::SRS>

=item L<System or Segment Design Document (SSDD) DID|Docs::US_DOD::SSDD>

=item L<System or Subsystem Specification (SSS) DID|Docs::US_DOD::SSS>

=item L<Software Test Description (STD) DID|Docs::US_DOD::STD>

=item L<Software Test Plan (STP) DID|Docs::US_DOD::STP>

=item L<Software Test Report (STR) DID|Docs::US_DOD::STR>

=item L<Software Transition Plan (STrP) DID|Docs::US_DOD::STrP>

=item L<Software User Manual (SUM) DID|Docs::US_DOD::SUM>

=item L<Software Version Description (SVD) DID|Docs::US_DOD::SVD>

=item L<Version Description Document (VDD) DID|Docs::US_DOD::VDD>

=back

=for html
<hr>
<p><br>
<!-- BLK ID="PROJECT_MANAGEMENT" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="NOTICE" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="OPT-IN" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="LOG_CGI" -->
<!-- /BLK -->
<p><br>

=cut

1;

__DATA__

DISTNAME: DataPort-FormDB^
VERSION : 0.04^
REPOSITORY_DIR: packages^
FREEZE: 1^

PREVIOUS_DISTNAME:  ^
REVISION: B^
PREVIOUS_RELEASE: 0.03^
AUTHOR  : SoftwareDiamonds.com E<lt>support@SoftwareDiamonds.comE<gt>^

ABSTRACT: 
Text Form Datatbase with advantages over CSV that has text separation
sequences with very simple escapes so the separation sequences never
appear in the data.
^

TITLE   : DataPort::FilteType::FormDB - Text Form Datatbase with advantages over CSV^
END_USER: General Public^
COPYRIGHT: copyright © 2003 Software Diamonds^
CLASSIFICATION: NONE^
TEMPLATE:  ^
CSS: help.css^
SVD_FSPEC: Unix^

COMPRESS: gzip^
COMPRESS_SUFFIX: gz^

REPOSITORY: 
  http://www.softwarediamonds/packages/
  http://www.perl.com/CPAN-local/authors/id/S/SO/SOFTDIA/
^

RESTRUCTURE:  ^

CHANGE2CURRENT:
return if $file =~ s=t/DataPort/DataFile=t/DataPort/DataFile/DataFile=;
return if $file =~ s=t/DataPort/FormDB=t/DataPort/FormDB/FormDB=;
^

AUTO_REVISE:
lib/DataPort/*
lib/DataPort/FileType/*
t/DataPort/*
^

PREREQ_PM: 
'File::FileUtil' => 0,
'Test::Tech' => 0
^

TESTS:
t/DataPort/FormDB.t
t/DataPort/DataFile.t
^

EXE_FILES:  ^

CHANGES: 
Changed the name of "Test::Tester" to "Test::Tech".
The name "Test::Tester" is taken on CPAN as an upload.

Broke up the STD support utilities "Test::TestUtil"
into "File::FileUtil", "Test::STD::Scrub" and
"Test::STD::STDutil"

Theses changes impacted the test software.

Changes to previous revisions are as follows:

\=over 4

\=item DataPort_FormDB 0.01

Originated

\=item DataPort_FormDB 0.02

At 04:10 AM 6/9/2003 +0000, Josts Smokehouse wrote:

Hello, Samson Monaco Tutankhamen! Thanks for uploading your works to CPAN.

I noticed that the test suite seem to fail without these modules:

STD::Tester

As such, adding the prerequisite module(s) to 'PREREQ_PM' in your
Makefile.PL should solve this problem.  For example:


 WriteMakefile(
    AUTHOR      => 'Samson Monaco Tutankhamen (support@SoftwareDiamonds.com)',
    ... # other information
    PREREQ_PM   => {
        'STD::Tester'   => '0', # or a minimum workable version
    }
 );


If you are interested in making a more flexible Makefile.PL that can
probe for missing dependencies and install them, ExtUtils::AutoInstall
at <http://search.cpan.org/search?dist=ExtUtils-AutoInstall> may be
worth a look.

Thanks! :-)

~~~~~~~~~~~~~~~~~

CORRECTIVE ACTION:

The Makefile.PL is automatically generated by ExtUtils::SVDmaker
from the data stored in the DataPort::FileType::FormDB format
in the Docs::Site_SVD::DataPort-FormDB module.
For now, in Docs::Site_SVD::DataPort-FormDB

Changed 

 PREREQ_PM: ^^

to

 PREREQ_PM:
 'Test::TestUtil' => 0,
 'Test::Tester' => 0,
 ^^

and regenerated the distribution using ExtUtils::SVDmaker

Uploaded Test::TestUtil and Test::Tester to CPAN in order to 
resolve the prerequiste.

\=item DataPort_FormDB 0.03

Resolved a CPAN namespace conflict by changing the name
of Test::Tester to Test::Tech.

\=back
^

DOCUMENT_OVERVIEW:
This document releases ${NAME} version ${VERSION}
providing description of the inventory, installation
instructions and other information necessary to
utilize and track this release.
^

CAPABILITIES:
The system is the Perl programming language software.
As established by the Perl referenced documents,
program modules, such the "DataPort::*" modules, extend the Perl language.

The "DataPort::*" program modules accesses different types of
data sources in different formats
and streams them to a stanadard pure Perl API. 

The feature data source is the text base FormDB. 
The FormDB data source has improve flexability and
performance over other text base formats such as the Comma Separated
Variable (CSV) format.

The text format resembles as much as possible the standard hard copy forms.
An example of a "L<DatatPort::FIleType::FormDB|DatatPort::FIleType::FormDB>
record follows:

 manhood length: ________ ^^
 time spent in big house: _________ ^^

 what drugs do you use:
 _________ 
 _________ 

 ^^

 ~--~

The ':' separates field names and field content.
The '^^' tags the end of a field and the '~--~' tags the
end of the record.
The separation sequences are escaped within the form
by adding an extra character as follows:

  sequence  escaped
  --------  --------
  ~--~       ~---~
  ~---~      ~----~
  ^^         ^^^
  ^^^        ^^^^
  :         :
  ::        :::

Since ~--~ never appears inside a record, Perl can very
easily find the record separators just by ... well ...
searching for it. The search for the end of field
and end of field name are just a little bit more 
complicated. Search for a  ':' or '^^' all by itself.
Escaping and unescaping is just adding one more
':', '^^', '-' or removing one of these characters.

The FormDB record looks very much like a hard copy 
form yet is very simple and straight forward for
Perl or any other programming language to process.

The DataPort::FileType::FormDB module is an integral part of the
US DOD SDT2167A bundle of modules.
The data used by Test::STDmaker and ExtUtils::SVDmaker are
stored in this format.

The dependency of the program modules in the US DOD STD2167A bundle is as follows:
 
 File::FileUtil 
   Test::STD::Scrub
     Test::Tech
        DataPort::FileType::FormDB DataPort::DataFile Test::STD::STDutil
            Test::STDmaker ExtUtils::SVDmaker

Note the 
L<File::FileUtil|File::FileUtil>, 
L<Test::STD::STDutil|Test::STD::STDutil> 
L<Test::STD::Scrub|Test::STD::Scrub> 
program modules breaks up 
the Test::TestUtil program module
and Test::TestUtil has disappeared.
^

LICENSE:
Software Diamonds permits the redistribution
and use in source and binary forms, with or
without modification, provided that the 
following conditions are met: 

\=over 4

\=item 1

Redistributions of source code, modified or unmodified
must retain the above copyright notice, this list of
conditions and the following disclaimer. 

\=item 2

Redistributions in binary form must 
reproduce the above copyright notice,
this list of conditions and the following 
disclaimer in the documentation and/or
other materials provided with the
distribution.

\=back

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


INSTALLATION:
To installed the release file, use the CPAN module in the Perl release
or the INSTALL.PL script at the following web site:

 http://packages.SoftwareDiamonds.com

Follow the instructions for the the chosen installation software.

The distribution file is at the following respositories:

${REPOSITORY}
^


PROBLEMS:
There are no known open issues.
^

SUPPORT:
603 882-0846 E<lt>support@SoftwareDiamonds.comE<gt>
^

NOTES:
The following are useful acronyms:

\=over 4

\=item .d

extension for a Perl demo script file

\=item .pm

extension for a Perl Library Module

\=item .t

extension for a Perl test script file

\=item DID

Data Item Description

\=item POD

Plain Old Documentation

\=item SVD

Software Version Description

\=back
^

SEE_ALSO:

Modules with end-user functional interfaces 
relating to US DOD 2167A automation are
as follows:

\=over 4

\=item L<Test::STDmaker|Test::STDmaker>

\=item L<ExtUtils::SVDmaker|ExtUtils::SVDmaker>

\=item L<DataPort::FileType::FormDB|DataPort::FileType::FormDB>

\=item L<DataPort::DataFile|DataPort::DataFile>

\=item L<Test::Tech|Test::Tech>

\=item L<Test|Test>

\=item L<Data::Dumper|Data::Dumper>

\=item L<Test::STD::Scrub|Test::STD::Scrub>

\=item L<Test::STD::STDutil|Test::STD::STDutil>

\=item L<File::FileUtil|File::FileUtil>

\=back

The design modules for L<Test::STDmaker|Test::STDmaker>
have no other conceivable use then to support the
L<Test::STDmaker|Test::STDmaker> functional interface. 
The  L<Test::STDmaker|Test::STDmaker>
design module are as follows:

\=over 4

\=item L<Test::STD::Check|Test::STD::Check>

\=item L<Test::STD::FileGen|Test::STD::FileGen>

\=item L<Test::STD::STD2167|Test::STD::STD2167>

\=item L<Test::STD::STDgen|Test::STD::STDgen>

\=item L<Test::STDtype::Demo|Test::STDtype::Demo>

\=item L<Test::STDtype::STD|Test::STDtype::STD>

\=item L<Test::STDtype::Verify|Test::STDtype::Verify>

\=back


Some US DOD 2167A Software Development Standard, DIDs and
other related documents that complement the 
US DOD 2167A automation are as follows:

\=over 4

\=item L<US DOD Software Development Standard|Docs::US_DOD::STD2167A>

\=item L<US DOD Specification Practices|Docs::US_DOD::STD490A>

\=item L<Computer Operation Manual (COM) DID|Docs::US_DOD::COM>

\=item L<Computer Programming Manual (CPM) DID)|Docs::US_DOD::CPM>

\=item L<Computer Resources Integrated Support Document (CRISD) DID|Docs::US_DOD::CRISD>

\=item L<Computer System Operator's Manual (CSOM) DID|Docs::US_DOD::CSOM>

\=item L<Database Design Description (DBDD) DID|Docs::US_DOD::DBDD>

\=item L<Engineering Change Proposal (ECP) DID|Docs::US_DOD::ECP>

\=item L<Firmware support Manual (FSM) DID|Docs::US_DOD::FSM>

\=item L<Interface Design Document (IDD) DID|Docs::US_DOD::IDD>

\=item L<Interface Requirements Specification (IRS) DID|Docs::US_DOD::IRS>

\=item L<Operation Concept Description (OCD) DID|Docs::US_DOD::OCD>

\=item L<Specification Change Notice (SCN) DID|Docs::US_DOD::SCN>

\=item L<Software Design Specification (SDD) DID|Docs::US_DOD::SDD>

\=item L<Software Development Plan (SDP) DID|Docs::US_DOD::SDP> 

\=item L<Software Input and Output Manual (SIOM) DID|Docs::US_DOD::SIOM>

\=item L<Software Installation Plan (SIP) DID|Docs::US_DOD::SIP>

\=item L<Software Programmer's Manual (SPM) DID|Docs::US_DOD::SPM>

\=item L<Software Product Specification (SPS) DID|Docs::US_DOD::SPS>

\=item L<Software Requirements Specification (SRS) DID|Docs::US_DOD::SRS>

\=item L<System or Segment Design Document (SSDD) DID|Docs::US_DOD::SSDD>

\=item L<System or Subsystem Specification (SSS) DID|Docs::US_DOD::SSS>

\=item L<Software Test Description (STD) DID|Docs::US_DOD::STD>

\=item L<Software Test Plan (STP) DID|Docs::US_DOD::STP>

\=item L<Software Test Report (STR) DID|Docs::US_DOD::STR>

\=item L<Software Transition Plan (STrP) DID|Docs::US_DOD::STrP>

\=item L<Software User Manual (SUM) DID|Docs::US_DOD::SUM>

\=item L<Software Version Description (SVD) DID|Docs::US_DOD::SVD>

\=item L<Version Description Document (VDD) DID|Docs::US_DOD::VDD>

\=back

^

HTML:
<hr>
<p><br>
<!-- BLK ID="PROJECT_MANAGEMENT" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="NOTICE" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="OPT-IN" -->
<!-- /BLK -->
<p><br>
<!-- BLK ID="LOG_CGI" -->
<!-- /BLK -->
<p><br>
^
~-~


