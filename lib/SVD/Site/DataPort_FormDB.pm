#!perl
#
# The copyright notice and plain old documentation (POD)
# are at the end of this file.
#
package  SVD::Site::DataPort_FormDB;

use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE $FILE );
$VERSION = '0.01';
$DATE = '2003/06/08';
$FILE = __FILE__;

use vars qw(%INVENTORY);
%INVENTORY = (
    'lib/SVD/Site/DataPort_FormDB.pm' => [qw(0.01 2003/06/08), 'new'],
    'MANIFEST' => [qw(0.01 2003/06/08), 'generated new'],
    'Makefile.PL' => [qw(0.01 2003/06/08), 'generated new'],
    'README' => [qw(0.01 2003/06/08), 'generated new'],
    'lib/DataPort/DataFile.pm' => [qw(0.01 2003/06/08), 'new'],
    'lib/DataPort/DataFileI.pm' => [qw(0.01 2003/06/08), 'new'],
    'lib/DataPort/FileType/FormDB.pm' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile-STD.pm' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile.d' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile.std' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile.t' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile0.tdb' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile2.tdb' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile2.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile3.tdb' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile3.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile4.tdb' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile4.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/DataFile5.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDB-STD.pm' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDB.d' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDB.std' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDB.t' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDB0.tdb' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBa2.tdb' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBa2.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBa3.tdb' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBa3.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBa4.tdb' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBa4.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBr2.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBr3.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBr4.txt' => [qw(0.01 2003/06/08), 'new'],
    't/DataPort/FormDBs0.tdb' => [qw(0.01 2003/06/08), 'new'],

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

 Revision: -

 Version: 0.01

 Date: 2003/06/08

 Prepared for: General Public 

 Prepared by:  SoftwareDiamonds.com E<lt>support@SoftwareDiamonds.comE<gt>

 Copyright: copyright � 2003 Software Diamonds

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

This release adds text database capabilities.

=head2 1.3 Document overview.

This document releases DataPort::FormDB version 0.01
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

   http://www.softwarediamonds/packages/DataPort-FormDB-0.01
   http://www.perl.com/CPAN-local/authors/id/S/SO/SOFTDIA/DataPort-FormDB-0.01


=head2 3.1.2 Copyright.

copyright � 2003 Software Diamonds

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
 lib/SVD/Site/DataPort_FormDB.pm                              0.01    2003/06/08 new                     
 MANIFEST                                                     0.01    2003/06/08 generated new           
 Makefile.PL                                                  0.01    2003/06/08 generated new           
 README                                                       0.01    2003/06/08 generated new           
 lib/DataPort/DataFile.pm                                     0.01    2003/06/08 new                     
 lib/DataPort/DataFileI.pm                                    0.01    2003/06/08 new                     
 lib/DataPort/FileType/FormDB.pm                              0.01    2003/06/08 new                     
 t/DataPort/DataFile-STD.pm                                   0.01    2003/06/08 new                     
 t/DataPort/DataFile.d                                        0.01    2003/06/08 new                     
 t/DataPort/DataFile.std                                      0.01    2003/06/08 new                     
 t/DataPort/DataFile.t                                        0.01    2003/06/08 new                     
 t/DataPort/DataFile0.tdb                                     0.01    2003/06/08 new                     
 t/DataPort/DataFile2.tdb                                     0.01    2003/06/08 new                     
 t/DataPort/DataFile2.txt                                     0.01    2003/06/08 new                     
 t/DataPort/DataFile3.tdb                                     0.01    2003/06/08 new                     
 t/DataPort/DataFile3.txt                                     0.01    2003/06/08 new                     
 t/DataPort/DataFile4.tdb                                     0.01    2003/06/08 new                     
 t/DataPort/DataFile4.txt                                     0.01    2003/06/08 new                     
 t/DataPort/DataFile5.txt                                     0.01    2003/06/08 new                     
 t/DataPort/FormDB-STD.pm                                     0.01    2003/06/08 new                     
 t/DataPort/FormDB.d                                          0.01    2003/06/08 new                     
 t/DataPort/FormDB.std                                        0.01    2003/06/08 new                     
 t/DataPort/FormDB.t                                          0.01    2003/06/08 new                     
 t/DataPort/FormDB0.tdb                                       0.01    2003/06/08 new                     
 t/DataPort/FormDBa2.tdb                                      0.01    2003/06/08 new                     
 t/DataPort/FormDBa2.txt                                      0.01    2003/06/08 new                     
 t/DataPort/FormDBa3.tdb                                      0.01    2003/06/08 new                     
 t/DataPort/FormDBa3.txt                                      0.01    2003/06/08 new                     
 t/DataPort/FormDBa4.tdb                                      0.01    2003/06/08 new                     
 t/DataPort/FormDBa4.txt                                      0.01    2003/06/08 new                     
 t/DataPort/FormDBr2.txt                                      0.01    2003/06/08 new                     
 t/DataPort/FormDBr3.txt                                      0.01    2003/06/08 new                     
 t/DataPort/FormDBr4.txt                                      0.01    2003/06/08 new                     
 t/DataPort/FormDBs0.tdb                                      0.01    2003/06/08 new                     
 


=head2 3.3 Changes

This is the original release. There are no previous releases to change.

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

   http://www.softwarediamonds/packages/DataPort-FormDB-0.01
   http://www.perl.com/CPAN-local/authors/id/S/SO/SOFTDIA/DataPort-FormDB-0.01


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

 L<SOFTWARE VERSION DESCRIPTION (SVD) DID|US_DOD::SVD>

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
VERSION : 0.01^
REPOSITORY_DIR: packages^
FREEZE: 1^

PREVIOUS_DISTNAME:  ^
PREVIOUS_RELEASE:  ^
CHANGE2CURRENT:  ^
AUTHOR  : SoftwareDiamonds.com E<lt>support@SoftwareDiamonds.comE<gt>^
ABSTRACT: Text Data API^
REVISION: -^
TITLE   : Text Database API^
END_USER: General Public^
COPYRIGHT: copyright � 2003 Software Diamonds^
CLASSIFICATION: NONE^
TEMPLATE: SVD::Template::SVD001^
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

PREREQ_PM:  ^

TESTS:
t/DataPort/*.t
^

EXE_FILES:  ^

CHANGES: 
This is the original release. There are no previous releases to change.^

DOCUMENT_OVERVIEW:
This document releases ${NAME} version ${VERSION}
providing description of the inventory, installation
instructions and other information necessary to
utilize and track this release.
^

CAPABILITIES:
This release adds text database capabilities.
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
 L<SOFTWARE VERSION DESCRIPTION (SVD) DID|US_DOD::SVD>
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


