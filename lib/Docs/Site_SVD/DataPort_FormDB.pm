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
$VERSION = '0.02';
$DATE = '2003/06/12';
$FILE = __FILE__;

use vars qw(%INVENTORY);
%INVENTORY = (
    'lib/Docs/Site_SVD/DataPort_FormDB.pm' => [qw(0.02 2003/06/12), 'revised 0.01'],
    'MANIFEST' => [qw(0.02 2003/06/12), 'generated, replaces 0.01'],
    'Makefile.PL' => [qw(0.02 2003/06/12), 'generated, replaces 0.01'],
    'README' => [qw(0.02 2003/06/12), 'generated, replaces 0.01'],
    'lib/DataPort/DataFile.pm' => [qw(0.01 2003/06/08), 'unchanged'],
    'lib/DataPort/DataFileI.pm' => [qw(0.01 2003/06/08), 'unchanged'],
    'lib/DataPort/FileType/FormDB.pm' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile-STD.pm' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile.d' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile.std' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile.t' => [qw(0.02 2003/06/12), 'revised 0.01'],
    't/DataPort/DataFile0.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile2.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile2.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile3.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile3.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile4.tdb' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile4.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/DataFile5.txt' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDB-STD.pm' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDB.d' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDB.std' => [qw(0.01 2003/06/08), 'unchanged'],
    't/DataPort/FormDB.t' => [qw(0.02 2003/06/12), 'revised 0.01'],
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

 Text Database API

 Revision: A

 Version: 0.02

 Date: 2003/06/12

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

DataPort accesses different types of data sources in different formats
and streams them to a stanadard pure Perl API. 

The feature data source is the text base FormDB. 
The FormDB data source has improve flexiability and
performance over other text base formats such as the Comma Separated
Variable (CSV) format.

The DataPort::FileType::FormDB module is an integral part of the
US DOD SDT2167A bundle of modules.
The data used by Test::STDmaker and ExtUtils::SVDmaker are
stored in this format.

The dependency of the program modules in the US DOD STD2167A bundle is as follows:

 Test::TestUtil
     Test::Tester
        DataPort::FormDB
            Test::STDmaker ExtUtils::SVDmaker

=head2 1.3 Document overview.

This document releases DataPort::FormDB version 0.02
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

   http://www.softwarediamonds/packages/DataPort-FormDB-0.02
   http://www.perl.com/CPAN-local/authors/id/S/SO/SOFTDIA/DataPort-FormDB-0.02


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
 lib/Docs/Site_SVD/DataPort_FormDB.pm                         0.02    2003/06/12 revised 0.01
 MANIFEST                                                     0.02    2003/06/12 generated, replaces 0.01
 Makefile.PL                                                  0.02    2003/06/12 generated, replaces 0.01
 README                                                       0.02    2003/06/12 generated, replaces 0.01
 lib/DataPort/DataFile.pm                                     0.01    2003/06/08 unchanged
 lib/DataPort/DataFileI.pm                                    0.01    2003/06/08 unchanged
 lib/DataPort/FileType/FormDB.pm                              0.01    2003/06/08 unchanged
 t/DataPort/DataFile-STD.pm                                   0.01    2003/06/08 unchanged
 t/DataPort/DataFile.d                                        0.01    2003/06/08 unchanged
 t/DataPort/DataFile.std                                      0.01    2003/06/08 unchanged
 t/DataPort/DataFile.t                                        0.02    2003/06/12 revised 0.01
 t/DataPort/DataFile0.tdb                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile2.tdb                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile2.txt                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile3.tdb                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile3.txt                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile4.tdb                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile4.txt                                     0.01    2003/06/08 unchanged
 t/DataPort/DataFile5.txt                                     0.01    2003/06/08 unchanged
 t/DataPort/FormDB-STD.pm                                     0.01    2003/06/08 unchanged
 t/DataPort/FormDB.d                                          0.01    2003/06/08 unchanged
 t/DataPort/FormDB.std                                        0.01    2003/06/08 unchanged
 t/DataPort/FormDB.t                                          0.02    2003/06/12 revised 0.01
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

For a future project, should follow up on Mr. Smokehouse's
recommendation and investigate ExtUtils-AutoInstall.
Hopefully ExtUtils::SVDmaker can be extended 
by using ExtUtils::AutoInstall intact.
Using the work of others can result in instant feature creep.

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

   http://www.softwarediamonds/packages/DataPort-FormDB-0.02
   http://www.perl.com/CPAN-local/authors/id/S/SO/SOFTDIA/DataPort-FormDB-0.02


=head2 3.6.1 Installation support.

If there are installation problems or questions with the installation
contact

 603 882-0846 E<lt>support@SoftwareDiamonds.comE<gt>

=head2 3.6.2 Installation Tests.

Most Perl installation software will run the following test script(s)
as part of the installation:

 t/DataPort/DataFile.t
 t/DataPort/FormDB.t

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

 L<Software Version Description (SVD) DID|Docs::US_DOD::SVD>
 L<DataPort::FileType::FormDB|DataPort::FileType::FormDB>

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
VERSION : 0.02^
REPOSITORY_DIR: packages^
FREEZE: 1^

PREVIOUS_DISTNAME:  ^
PREVIOUS_RELEASE: 0.01^
CHANGE2CURRENT:  ^
AUTHOR  : SoftwareDiamonds.com E<lt>support@SoftwareDiamonds.comE<gt>^
ABSTRACT: Text Data API^
REVISION: A^
TITLE   : Text Database API^
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

AUTO_REVISE:
lib/DataPort/*
lib/DataPort/FileType/*
t/DataPort/*
^

PREREQ_PM:
'Test::TestUtil' => 0,
'Test::Tester' => 0,
^

TESTS:
t/DataPort/*.t
^

EXE_FILES:  ^

CHANGES: 
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

For a future project, should follow up on Mr. Smokehouse's
recommendation and investigate ExtUtils-AutoInstall.
Hopefully ExtUtils::SVDmaker can be extended 
by using ExtUtils::AutoInstall intact.
Using the work of others can result in instant feature creep.
^

DOCUMENT_OVERVIEW:
This document releases ${NAME} version ${VERSION}
providing description of the inventory, installation
instructions and other information necessary to
utilize and track this release.
^

CAPABILITIES:
DataPort accesses different types of data sources in different formats
and streams them to a stanadard pure Perl API. 

The feature data source is the text base FormDB. 
The FormDB data source has improve flexiability and
performance over other text base formats such as the Comma Separated
Variable (CSV) format.

The DataPort::FileType::FormDB module is an integral part of the
US DOD SDT2167A bundle of modules.
The data used by Test::STDmaker and ExtUtils::SVDmaker are
stored in this format.

The dependency of the program modules in the US DOD STD2167A bundle is as follows:

 Test::TestUtil
     Test::Tester
        DataPort::FormDB
            Test::STDmaker ExtUtils::SVDmaker

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
 L<Software Version Description (SVD) DID|Docs::US_DOD::SVD>
 L<DataPort::FileType::FormDB|DataPort::FileType::FormDB>
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


